require 'rails_helper'

RSpec.describe "User Dashboard/Show Page", type: :feature do
  it 'has the users info' do
    user1 = User.create!(name: "Jim", email: 'jim@mail.com')
    user2 = User.create!(name: "Tommy", email: 'tommy@mail.com')

    visit "/users/#{user1.id}"

    expect(page).to have_content("Jim's Dashboard")
    expect(page).not_to  have_content("Tommy's Dashboard")


  end

  it "has section that lists viewing parties" do
    user1 = User.create!(name: "Jim", email: 'jim@mail.com')
    user2 = User.create!(name: "Tommy", email: 'tommy@mail.com')

    visit "/users/#{user1.id}"

    expect(page).to have_content("Viewing Parties")
  end

  it "has button to discover movies" do
    user1 = User.create!(name: "Jim", email: 'jim@mail.com')
    user2 = User.create!(name: "Tommy", email: 'tommy@mail.com')

    visit "/users/#{user1.id}"

    expect(page).to have_button("Discover Movies")
  end
end
