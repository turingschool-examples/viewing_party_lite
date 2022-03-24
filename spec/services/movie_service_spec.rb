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

    it ".movie_details" do
      VCR.use_cassette('movie_details') do
        movie_details = MovieService.movie_details(24126)
        expect(movie_details).to be_instance_of(Hash)
        expect(movie_details.first).to be_instance_of(Array)
        expect(movie_details[:id]).to be_instance_of(Integer)
        expect(movie_details[:title]).to be_instance_of(String)
        expect(movie_details[:runtime]).to be_instance_of(Integer)
        expect(movie_details[:vote_average]).to be_instance_of(Float)
        expect(movie_details[:genres]).to be_instance_of(Array)
        expect(movie_details[:overview]).to be_instance_of(String)
      end 
    end

    it ".get_cast" do
      VCR.use_cassette('get_cast') do
        cast = MovieService.get_cast(24126)
        expect(cast).to be_instance_of(Array)
        expect(cast.first).to be_instance_of(Hash)
        expect(cast.first[:name]).to be_instance_of(String)
        expect(cast.first[:character]).to be_instance_of(String)
      end 
    end
  end
end
