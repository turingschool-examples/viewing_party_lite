require 'rails_helper'

RSpec.describe "User Disover Movie", type: :feature do
    it 'displays user attribues, name, discover movies, viewing parties' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")
        # party1 = ViewingParty.create!(duration: 90, date: "Mon, 29 Aug 2022 14:00:00 UTC +00:00", host_id: user2.id, movie_id: 244)
        # party2 = ViewingParty.create!(duration: 120, date: "Mon, 30 Aug 2022 17:00:00 UTC +00:00", host_id: user2.id, movie_id: 545)
        # userparty1= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
        # userparty2= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id)

        visit "/users/#{user1.id}"
        click_on "Discover Movies"
        # save_and_open_page

        expect(page).to have_current_path("/users/#{user1.id}/discover")
        expect(page).to have_content("Micheal Jordan Discover Movies")
        expect(page).to have_button("Top Rated Movies")
        expect(page).to have_button("Search")
        expect(page).to_not have_content("Kobe Bryant")
    end
    xit 'button to top rated movies works redirects to list' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/discover"
        click_on "Top Rated Movies"

    end

    xit 'has text field to search key words then redirects to matching list' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/discover"
        fill_in :search, with: "something"
        click_on "Search"

    end
end

# As a user,
# When I go to a user dashbaord,
# and click "Discover Movies" button,

#  I am redirected to a discover page '/users/:id/discover', where :id is the user id of the user who's dashboard I was just on.

# As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
#  Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.
# The movies will be retrieved by consuming The MovieDB API