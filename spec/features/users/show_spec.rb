require 'rails_helper'

RSpec.describe "User Dashboard/Show Page", type: :feature do
  it 'has the users info' do
    user1 = User.create!(name: "Amy", email: 'amy@mail.com')
    user2 = User.create!(name: "James", email: 'james@mail.com')

    visit "/users/#{user1.id}"

    expect(page).to have_content("Amy's Dashboard")
    expect(page).not_to  have_content("James's Dashboard")

    expect(page).to have_content("Viewing Parties")
  end

  it 'has a button to discover movies' do
    user1 = User.create!(name: "Amy", email: 'amy@mail.com')
    user2 = User.create!(name: "James", email: 'james@mail.com')

    visit "/users/#{user1.id}"

    click_on "Discover Movies"
    expect(current_path).to eq("/users/#{user1.id}/discover")
  end
end
