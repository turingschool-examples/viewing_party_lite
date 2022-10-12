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
  describe 'When I visit a movies detail page' do
    VCR.use_cassette('minion-details') do
      # let!(:movie) { Movie.new({title: "Minions", vote_average: "8.7", id: 124}) }
      let!(:user) { create :user }

      it 'displays a button to create a viewing party and a button to return to the discover page' do
        visit user_movie_path(user, movie.id)

        expect(page).to have_button("Create a Viewing Party for #{movie.title}")
        expect(page).to have_button('Discover Page')
      end

      xit 'displays movie title/vote average/runtime/genre/summary/10 cast members/count of reviews/reviews author and information' do
        visit user_movie_path(user, movie.id)

        expect(page).to have_content("#{movie.title}")
        expect(page).to have_content("#{movie.vote_average}")
        expect(page).to have_content("#{movie.runtime}") #this should be in hours/minutes
        expect(page).to have_content("#{movie.genre}")# multiple genres
        expect(page).to have_content("#{movie.summary}")# this is overview
        expect(page).to have_content("#{movie.cast_members}")# this is first 10 members(characters&real names)
        expect(page).to have_content("#{movie.reviews.count}") #count of total reviews, probably wont test it like this but leaving this here
        # expect(page).to have_content("#{movie.}") #reviews author and information
      end
    end
  end
end