require 'rails_helper'

RSpec.describe 'a user dashboard' do
  it 'displays a header with the users name' do
    user_1 = User.create!(name: 'Buggs', email: 'buggs@bunny.com')
    user_2 = User.create!(name: 'Elmer', email: 'elmer@fudd.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("Buggs's Dashboard")
    expect(page).to have_no_content("Elmer's Dashboard")
  end

  it 'has a Discover Movies button' do
      user1 = User.create!(name: 'Will', email: 'abc@mail.com')

      visit "/users/#{user1.id}"
      click_button "Discover Movies"

      expect(page).to have_current_path("/users/#{user1.id}/discover")
    end

  it 'has a section that lists viewing parties' do
    user1 = User.create!(name: 'Will', email: 'abc@mail.com')

    visit "/users/#{user1.id}"

    within '#viewing_parties' do
      expect(page).to have_content('Viewing Parties')
    end
  end

  it 'displays the viewing party that the user has been invited to with details', :vcr do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')
    user_2 = User.create!(name: 'Charles', email: 'abc@mail.com')
    user_3 = User.create!(name: 'Dylan', email: 'xyz@mail.com')
    user_4 = User.create!(name: 'Samantha', email: 'sam@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"
    fill_in :duration, with: '142'
    fill_in :date, with: Date.current
    fill_in :start_time, with: '00:54 PM'
    within "#user-#{user_2.id}" do
      check
    end

    click_button "Create Party"
save_and_open_page
    expect(current_path).to eq("/users/#{user_1.id}")
  end
end
