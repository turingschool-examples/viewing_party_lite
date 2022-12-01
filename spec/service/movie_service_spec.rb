require 'rails_helper'

RSpec.describe MovieService do
  describe '#class methods'
  
    it 'top_rated', :vcr do
      ms = MovieService.top_rated
      md = ms[:results].first

      expect(ms).to be_a(Hash)
      expect(ms[:results]).to be_a(Array)
      expect(md).to have_key :title
      expect(md[:title]).to be_a(String)
      expect(md).to have_key :vote_average
      expect(md[:vote_average]).to be_a(Float)
    end

    it "movies_by_keyword", :vcr do
      results = MovieService.movies_by_keyword("Fight Club")
      data = results[:results].first

      expect(results).to be_a(Hash)
      expect(results[:results]).to be_a(Array)
      expect(data).to have_key :title
      expect(data[:title]).to be_a(String)
      expect(data).to have_key :vote_average
      expect(data[:vote_average]).to be_a(Float)
    end

    it 'movie_details', :vcr do
      movie_details = MovieService.movie_details(505)

      expect(movie_details).to be_a(Hash)
      expect(movie_details).to have_key :title
      expect(movie_details[:title]).to be_a(String)
      expect(movie_details).to have_key :vote_average
      expect(movie_details[:vote_average]).to be_a(Float)
      expect(movie_details).to have_key :runtime
      expect(movie_details[:runtime]).to be_a(Integer)
      expect(movie_details).to have_key :genres
      expect(movie_details[:genres]).to be_a(Array)
      expect(movie_details).to have_key :overview
      expect(movie_details[:overview]).to be_a(String)
    end

    it 'movie_reviews', :vcr do
      results = MovieService.get_movie_reviews(500)
      data = results[:results].first

      expect(results).to be_a(Hash)
      expect(results[:results]).to be_a(Array)
      expect(data).to have_key :author
      expect(data[:author]).to be_a(String)
      expect(data).to have_key :content
      expect(data[:content]).to be_a(String)
    end
end