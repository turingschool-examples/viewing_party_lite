require 'rails_helper'

RSpec.describe "Movie Index Page", :vcr do
    it 'has a button to discover top rated movies' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/discover"
        click_button "Discover Top Rated Movies"
        
        expect(current_path).to eq("/users/#{user1.id}/movies")
        expect(page).to have_content("The Shawshank Redemption")
    end
    it 'has a button to return to discover page' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/movies?"
        
        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq("/users/#{user1.id}/discover")
    end
end


# When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies?q=top%20rated, 
#/users/:user_id/movies?q=keyword respectively) where I see:

#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
# Details: There should only be a maximum of 40 results. The above details should be listed for each movie.

#  I should also see a button to return to the Discover Page.