require 'rails_helper'

RSpec.describe "MovieDB Service" do
  describe 'happy path' do
    it 'can get popular movies', :vcr do
      response = MovieService.popular_movies_call_page_1

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)

      first_movie = response[:results][0]

      expect(first_movie).to have_key(:title)
      expect(first_movie).to have_key(:overview)
      expect(first_movie).to have_key(:vote_average)
    end

    it 'can get movie_details', :vcr do
      response = MovieService.movie_details_call(238)

      expect(response).to be_a(Hash)

      expect(response).to have_key(:title)
      expect(response).to have_key(:overview)
      expect(response).to have_key(:vote_average)
    end

    it 'can get cast details', :vcr do
      response = MovieService.cast_call(238)

      expect(response).to be_a(Hash)

      first_cast_member = response[:cast][0]

      expect(first_cast_member).to have_key(:name)
      expect(first_cast_member).to have_key(:character)
    end

    it 'can get review details', :vcr do
      response = MovieService.reviews_call(238)

      expect(response).to be_a(Hash)

      first_review = response[:results][0]

      expect(first_review).to have_key(:author)
      expect(first_review).to have_key(:content)
    end
  end
end
