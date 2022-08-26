require 'rails_helper'

RSpec.describe MovieService do
  describe '#class methods'
    it 'top_rated' do
      ms = MovieService.top_rated
      md = ms[:results].first

      expect(ms).to be_a(Hash)
      expect(ms[:results]).to be_a(Array)
      expect(md).to have_key :title
      expect(md[:title]).to be_a(String)
      expect(md).to have_key :vote_average
      expect(md[:vote_average]).to be_a(Float)
    end

    it "movies_by_keyword" do

      results = MovieService.movies_by_keyword("Fight Club")

      expect(results).to be_a(Hash)
    end

    it 'movie_details' do
      movie_details = MovieService.movie_details(505)

      expect(movie_details).to be_a(Hash)
    end

    it 'movie_reviews' do
      results = MovieService.get_movie_reviews(500)

      expect(results).to be_a(Hash)
    end
end