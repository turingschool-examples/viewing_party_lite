# require 'rails_helper'
# #The discover movie spec should be testing the api end points (user story 8)

# RSpec.describe "Discover Movie", type: :feature do
#     # it 'button to top rated movies' do

#     #     user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

#     #     visit "/users/#{user1.id}/discover"

#     #     click_button "Top Rated Movies"
        
#     #     expect(current_path).to eq("/users/#{user1.id}/movies")
#     # end
# end

    # xit 'has text field to search key words then redirects to matching list' do
    #     user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

    #     visit "/users/#{user1.id}/discover"
    #     fill_in :search, with: "something"
    #     click_on "Search"

    # end
# end

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