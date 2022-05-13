# frozen_string_literal: true

require 'rails_helper'

describe MovieService do
  context 'instance methods' do
    it '.top_movies returns an array with 40 movie hashes' do
      service = MovieService.new
      response = service.top_movies

      expect(response.length).to eq(40)
      expect(response).to be_all(Hash)
      expect(response[0][:original_title]).to be_a(String)
    end

    it '.movies_by_query(query) returns the first 40 movies with titles that include the query' do
      service = MovieService.new
      response = service.movies_by_query('mad')
      all_titles = response.map { |movie| movie[:original_title] }

      check_all_titles_for_query = all_titles.map { |title| title.downcase.include?('mad') }

      expect(response.length).to eq(40)
      expect(check_all_titles_for_query).to be_all(true)
    end

    it '.movie_info(movie_id) returns info of a given movie_id' do
      service = MovieService.new
      movie_id = 550
      response = service.movie_details(movie_id)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:original_title)
      expect(response[:original_title]).to be_a(String)
    end

    it '.cast returns an array of hashes' do
      service = MovieService.new
      response = service.cast(550)

      expect(response).to be_a(Array)
      expect(response).to be_all(Hash)

      expect(response[0]).to have_key(:name)
      expect(response[0]).to have_key(:character)
    end
  end
end
