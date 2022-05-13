# frozen_string_literal: true

require 'rails_helper'

describe MovieFacade do
  context 'class methods' do
    it '.service creates a MovieService object' do
      service = MovieFacade.service

      expect(service).to be_a(MovieService)
    end

    it '.top_rated returns an array of 40 movie POROs' do
      poros = MovieFacade.top_rated

      expect(poros.count).to eq(40)
      expect(poros).to be_all(Movie)
    end

    it '.find_movies(query) returns the first 40 movie POROs that match the query' do
      poros = MovieFacade.find_movies('mad')
      movie_titles = poros.map(&:title)
      titles_include_query = movie_titles.map { |title| title.downcase.include?('mad') }

      expect(poros.count).to eq(40)
      expect(titles_include_query).to be_all(true)
      expect(poros).to be_all(Movie)
    end
  end
end
