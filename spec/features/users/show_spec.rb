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
    user3 = User.create!(name: "Hoju", email: 'hoju@mail.com')
    party1 = Party.create!(duration: 300, date: Date.today, start_time: Time.now, user_id: user1.id, movie_id: 298)
    partyuser1 = PartyUser.create!(party: party1, user: user1)
    partyuser2 = PartyUser.create!(party: party1, user: user2)
    party2 = Party.create!(duration: 300, date: Date.today, start_time: Time.now, user_id: user2.id, movie_id: 19404)
    partyuser3 = PartyUser.create!(party: party2, user: user1)
    partyuser4 = PartyUser.create!(party: party2, user: user2)


    visit "/users/#{user2.id}"

    expect(page).to have_content("Viewing Parties")

    within ".invited" do
    expect(page).to have_content("Parties I am invited to")
    expect(page).to have_content("298")
    expect(page).to_not have_content("19404")
    end

    within ".hosting" do
    expect(page).to have_content("Parties I am hosting")
    expect(page).to_not have_content("298")
    expect(page).to have_content("19404")
    end


  end

  it "has button to discover movies" do
    user1 = User.create!(name: "Jim", email: 'jim@mail.com')
    user2 = User.create!(name: "Tommy", email: 'tommy@mail.com')

    visit "/users/#{user1.id}"

    expect(page).to have_button("Discover Movies")
  end

  it "Button to discover movies redirects to movie discover/index" do
    user1 = User.create!(name: "Jim", email: 'jim@mail.com')
    user2 = User.create!(name: "Tommy", email: 'tommy@mail.com')

    visit "/users/#{user1.id}"
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end
end
