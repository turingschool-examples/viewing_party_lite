require 'rails_helper'

RSpec.describe 'the user dashboard' do
  let!(:users) { create_list(:user, 4) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }
  let!(:user4) { users.last }

  it 'links to the user dashboard' do
    visit root_path

    click_link("#{user1.email}'s Dashboard")

    expect(current_path).to eq(user_dashboard_path(user1))
  end

  it 'displays username at the top of the page' do
    visit user_dashboard_path(user1)

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    visit user_dashboard_path(user1)

    expect(page).to have_button('Discover Movies')
  end

  it 'has a section tha lists viewing parties' do
    visit user_dashboard_path(user1)

    expect(page).to have_content('Viewing Parties')
  end

  it 'viewing party postings', :vcr do
    visit user_movie_viewing_party_new_path(user1, 238)

    fill_in 'Day', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_#{user2.id}")
    check("attendees_#{user3.id}")

    click_button 'Create Party'

    expect(page).to have_link('The Godfather')
    expect(page).to have_content(Date.tomorrow.strftime('%B %e, %Y') )
    expect(page).to have_content('Hosting')
    expect(page).to have_content("Hosted By: #{user1.name}")
    expect(page).to have_content("Attendees: #{user2.name} #{user3.name}")
    expect(page).to_not have_content(user4.name)

    visit user_dashboard_path(user2)

    expect(page).to have_link('The Godfather')
    expect(page).to have_content(Date.tomorrow.strftime('%B %e, %Y') )
    expect(page).to have_content('Invited')

    visit user_movie_viewing_party_new_path(user2, 553512)

    fill_in 'Day', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_#{user1.id}")
    check("attendees_#{user3.id}")

    click_button 'Create Party'

    expect(page).to have_link('Burn the Stage: The Movie')
    expect(page).to have_content(Date.tomorrow.strftime('%B %e, %Y') )
    expect('Burn the Stage: The Movie').to appear_before('The Godfather')
    expect(page).to have_content("Hosted By: #{user2.name}")
    expect(page).to have_content("Attendees: #{user1.name} #{user3.name}")
    expect(page).to_not have_content(user4.name)

    visit user_dashboard_path(user4)

    expect(page).to_not have_link('Burn the Stage: The Movie')
    expect(page).to_not have_link('The Godfather')
    expect(page).to_not have_content('Invited')
    expect(page).to_not have_content('Hosting')
    expect(page).to_not have_content('Hosted By: ')
    expect(page).to_not have_content('Attendees: ')
  end
end