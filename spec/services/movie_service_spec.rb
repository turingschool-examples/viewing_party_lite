require 'rails_helper'

describe MovieService do
  context 'instance methods' do
    it '.get_url(url) returns an array with a ruby hash' do
      service = MovieService.new
      response = service.get_url('https://api.coinbase.com/v2/currencies')

      expect(response).to be_a(Array)
      expect(response[0]).to be_a(Hash)
    end

    it '.top_movies returns an array with 40 movie hashes' do
      service = MovieService.new
      response = service.top_movies
      
      expect(response.length).to_eq(40)
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
  end
end
