require 'rails_helper'

RSpec.describe 'the movies result page' do 
  describe 'as a user' do 
    it 'i see the movie title as a link to the movie details page and the vote average of the movie' do 
      VCR.use_cassette('top_rated_movies') do 
        movies = MoviesService.top_rated_movies
        @first_movie = movies[:results].first
        @last_movie = movies[:results].last
      end

      VCR.use_cassette('top_rated_movies') do 
        user1 = create(:user)

        visit "users/#{user1.id}/movies"

        within "#movies" do 
          expect(page).to have_link(@first_movie[:title])
          expect(page).to have_content(@first_movie[:vote_average])

          expect(page).to have_link(@last_movie[:title])
          expect(page).to have_content(@last_movie[:vote_average])

          # Can we test for amount of items on page?
        end
      end
    end
  end
end