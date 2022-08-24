require 'rails_helper'

RSpec.describe "User Dashboard Page", type: :feature do
    it 'displays user attribues, name, discover movies, viewing parties' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")

        visit "/"
        click_on "Micheal Jordan"

        expect(page).to have_current_path("/users/#{user1.id}")
        expect(page).to have_content("Micheal Jordan's Dashboard")
        expect(page).to have_content("Viewing Parties:")
        expect(page).to have_button("Discover Movies")
        expect(page).to_not have_content("Kobe Bryant")
    end
    it 'a users dashboard shows all viewing parties' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")
    
        party1 = ViewingParty.create!(duration: 90, date: "Mon, 29 Aug 2022 14:00:00 UTC +00:00", host_id: user2.id, movie_id: 244)
        party2 = ViewingParty.create!(duration: 120, date: "Mon, 30 Aug 2022 17:00:00 UTC +00:00", host_id: user2.id, movie_id: 545)
        userparty1= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
        userparty2= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id)

        visit "/users/#{user1.id}"

        expect(page).to have_content("Viewing Parties:")
        expect(page).to have_content(party1.id)
        expect(page).to have_content(party2.id)

    end

end


# When I visit '/users/:id' where :id is a valid user id,
# I should see:

#  "<user's name>'s Dashboard" at the top of the page
#  A button to Discover Movies*
#  A section that lists viewing parties**
# *more instructions on this in the Dashboard:Discover Movies issue.
# **more instructions on this in the Dashboard:Viewing Parties issue.