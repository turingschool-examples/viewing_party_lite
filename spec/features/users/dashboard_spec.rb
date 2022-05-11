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
end
