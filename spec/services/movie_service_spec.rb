require 'rails_helper'

RSpec.describe MovieService do
  describe 'methods for service' do
    it 'returns movie search', :vcr do
      movie = MovieService.all_movie_id_search(238)

      expect(movie).to be_a(Hash)

      expect(movie).to have_key(:id)
      expect(movie[:id]).to be_a(Integer)

      expect(movie).to have_key(:title)
      expect(movie[:title]).to be_a(String)

      expect(movie).to have_key(:runtime)
      expect(movie[:runtime]).to be_a(Integer)

      expect(movie).to have_key(:vote_average)
      expect(movie[:vote_average]).to be_a(Float)

      expect(movie).to have_key(:genres)
      expect(movie[:genres]).to be_an(Array)

      expect(movie).to have_key(:overview)
      expect(movie[:overview]).to be_a(String)
    end

    it 'returns cast', :vcr do
      cast = MovieService.get_movie_cast(238)

      expect(cast).to have_key(:cast)
      expect(cast[:cast]).to be_an(Array)

      expect(cast[:cast].first).to have_key(:name)
      expect(cast[:cast][0][:name]).to be_a(String)

      expect(cast[:cast].first).to have_key(:character)
      expect(cast[:cast][0][:character]).to be_a(String)
    end

    it 'returns reviews', :vcr do
      reviews = MovieService.get_reviews(238)

      expect(reviews).to have_key(:results)
      expect(reviews[:results]).to be_a(Array)

      expect(reviews[:results].first).to have_key(:author)
      expect(reviews[:results].first[:author]).to be_a(String)

      expect(reviews[:results].first).to have_key(:content)
      expect(reviews[:results].first[:content]).to be_a(String)
    end

    it 'retrieves data and parses response', :vcr do
      top_rated = MovieService.find_top_rated

      expect(top_rated).to be_a(Hash)
      expect(top_rated[:results]).to be_a(Array)
      movie = top_rated[:results].first

      expect(movie).to include(:title, :vote_average)
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end
  end
end