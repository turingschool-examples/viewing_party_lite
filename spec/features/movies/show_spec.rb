# Button to create a viewing party
# Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

# Movie Title
# Vote Average of the movie
# Runtime in hours & minutes
# Genre(s) associated to movie
# Summary description
# List the first 10 cast members (characters&actress/actors)
# Count of total reviews
# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API


require 'rails_helper'

RSpec.describe 'movies show page' do
  describe 'When I visit /users/:user_id/movies/:movie_id' do
    describe 'should see' do

      it 'has Button to create a viewing party' do 
        user1 = create(:user)
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)

        visit "/users/#{user1.id}/movies/#{movie[:id]}"

        expect(page).to have_content("Viewing Party Lite")
        expect(page).to have_link("Home")
        expect(page).to have_button("Create Viewing Party for #{movie[:title]}")
      end

      describe 'when I click create a viewing party button' do 
        it 'should redirect me to the new viewing party page' do 
          user1 = create(:user)
          movie_id = 11
          movie = MovieService.movie_by_id(movie_id)
          visit "/users/#{user1.id}/movies/#{movie[:id]}"

          click_button("Create Viewing Party for #{movie[:title]}")

          expect(current_path).to eq("/users/#{user1.id}/movies/#{movie[:id]}/viewing-party/new")

        end
      end

      it "has Button to return to the Discover Page" do 
        user1 = create(:user)
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)
        visit "/users/#{user1.id}/movies/#{movie[:id]}"
       
        click_button('Discover Movies')

        expect(current_path).to eq("/users/#{user1.id}/discover")
      end

      it 'has movie information' do
        user1 = create(:user)
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)
        visit "/users/#{user1.id}/movies/#{movie[:id]}"
save_and_open_page
        expect(page).to have_content("Viewing Paty Lite")
        expect(page).to have_link("Home")
        expect(page).to have_content("#{movie[:title]}")
        expect(page).to have_content("#{movie[:vote_average]}")
        expect(page).to have_content("#{movie[:runtime]} Minutes")
        expect(page).to have_content("#{movie[:genres]}")
        expect(page).to have_content("#{movie[:overview]}")
        expect(page).to have_content("#{movie[:vote_count]}")
      end 
    end 
  end
# List the first 10 cast members (characters&actress/actors)

# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API
  #     end
  #   end
  # end
end