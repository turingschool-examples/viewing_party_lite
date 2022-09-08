require 'rails_helper'

RSpec.describe 'the User show page' do
  it 'shows the users name at the top of the page' do
    user = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    # user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    # user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Geraldo's Dashboard")
  end

  it 'should have a button to discover movies' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit user_path(user1)

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')

    expect(current_path).to eq(discover_path)
  end

  it 'has a section that displays viewing parties hosted by the user', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit new_movie_viewing_party_path(278)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_ids_#{user2.id}")

    click_button 'Create Party'

    within '#vp-column-0' do
      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content(Date.tomorrow.strftime('%B%e, %Y'))
      # expect(page).to have_content(Time.strftime('%I:%M %p'))
      expect(page).to have_content('Hosting')
    end
  end

  it 'displays viewing parties which the user is invited', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit new_user_movie_viewing_party_path(user2, 238)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_ids_#{user1.id}")

    click_button 'Create Party'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit user_path(user1)

    within '#vp-column-0' do
      expect(page).to have_content('The Godfather')
      expect(page).to have_content(Date.tomorrow.strftime('%B%e, %Y'))
      # expect(page).to have_content(Time.strftime('%I:%M %p'))
      expect(page).to have_content('Invited')
    end
  end
end
