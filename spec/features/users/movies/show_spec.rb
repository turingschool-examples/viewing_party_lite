# When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see

#  Button to create a viewing party
#  Button to return to the Discover Page
# [ ]
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genre(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
# [ ]
# Details This information should come from 3 different endpoints from The Movie DB API
require 'rails_helper'

RSpec.describe 'the movies detail page' do
  
  let!(:user) { create :user }
  
  before :each do
    VCR.use_cassette('minion-details') do
      @movie = MoviesFacade.details(438148)
      visit user_movie_path(user, @movie.id)
    end
  end
  
  describe 'When I visit a movies detail page' do
    VCR.use_cassette('minion-details') do
      it 'displays a button to create a viewing party and a button to return to the discover page' do

        expect(page).to have_button("Create a Viewing Party for #{@movie.title}")
        expect(page).to have_button('Back to Discover Page')
      end

      describe 'when I click on the button to create a viewing party' do
        it 'takes me to the new viewing party page' do
          click_on "Create a Viewing Party for #{@movie.title}"

          expect(current_path).to eq(new_user_movie_viewing_party_path(user, @movie.id))
        end
      end

      describe 'when I click the button to return to the discover page' do
        it 'returns to discover page' do
          click_on "Back to Discover Page"

          expect(current_path).to eq(user_discover_index_path(user))
        end
      end

      it 'displays movie title/vote average/runtime/genre/summary/10 cast members/count of reviews/reviews author and information' do
        expect(page).to have_content("#{@movie.title}")
        expect(page).to have_content("#{@movie.vote_average}")
        expect(page).to have_content("#{@movie.hours_and_minutes}") 
        expect(page).to have_content("#{@movie.summary}")
        expect(page).to have_content("#{@movie.reviews.count}") 
        
        @movie.genres.each do |genre|
          expect(page).to have_content(genre)          
        end

        @movie.cast.each do |member|
          expect(page).to have_content(member)
        end

        @movie.reviews.each do |review|
          expect(page).to have_content(review[:author])
          # expect(page.has_content?("##{review[:author]}-text")).to eq(true)
        end
      end
    end
  end
end
