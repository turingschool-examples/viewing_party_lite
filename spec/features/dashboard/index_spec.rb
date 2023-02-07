require 'rails_helper'

RSpec.describe 'the User Dashboard' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  it 'shows the users name at the top of the page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  it 'should have a button to discover movies' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')

    expect(current_path).to eq(discover_path)
  end

  it 'has a section that displays viewing parties hosted by the user', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit new_movie_viewing_party_path(278)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_#{user2.id}")

    click_button 'Create Party'

    within "#vparty-0" do
      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_content(Date.tomorrow.strftime('%B%e, %Y'))
      # expect(page).to have_content(Time.strftime('%I:%M %p'))
      expect(page).to have_content("Hosted by: #{user1.name}")
      expect(page).to have_content("Attendees: #{user2.name}")
      expect(page).to have_content('Hosting')
    end
  end

  it 'displays viewing parties which the user is invited', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit new_movie_viewing_party_path(238)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_#{user1.id}")

    click_button 'Create Party'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit dashboard_path

    within "#vparty-0" do
      expect(page).to have_link('The Godfather')
      expect(page).to have_content(Date.tomorrow.strftime('%B%e, %Y'))
      expect(page).to have_content("Hosted by: #{user2.name}")
      expect(page).to have_content("Attendees: #{user1.name}")
      expect(page).to have_content('Invited')
    end
  end

  it 'cannot visit a dashboard without being logged in' do
    visit dashboard_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in')
  end
end
