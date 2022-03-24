require 'rails_helper'

RSpec.describe 'The Movie Service' do
  context 'Class Methods' do
    it ".top_rated" do
      VCR.use_cassette('top_rated') do
        all_top_movies = MovieService.top_rated
        expect(all_top_movies).to be_instance_of(Array)
        expect(all_top_movies.first).to be_instance_of(Hash)
        expect(all_top_movies.first[:id]).to be_instance_of(Integer)
        expect(all_top_movies.first[:title]).to be_instance_of(String)
        expect(all_top_movies.first[:vote_average]).to be_instance_of(Float)
      end
    end

    it ".search_for_movie" do
      VCR.use_cassette('search_for_movie') do
        all_top_movies = MovieService.search_for_movie('Jack Reacher')
        expect(all_top_movies).to be_instance_of(Array)
        expect(all_top_movies.first).to be_instance_of(Hash)
        expect(all_top_movies.first[:id]).to be_instance_of(Integer)
        expect(all_top_movies.first[:title]).to be_instance_of(String)
        expect(all_top_movies.first[:vote_average]).to be_instance_of(Float)
      end
    end
  end
end
