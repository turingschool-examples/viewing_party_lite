# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'MovieFacade#top_40' do
    it 'makes a service call and returns an array of movie POROs', :vcr do
      movies = MovieFacade.top_40

      expect(movies).to be_a Array
      expect(movies.count).to eq(40)
      expect(movies).to be_all Movie
    end
  end

  describe 'search_by_keyword(keyword)'
  describe 'find_movie(id)'
  describe 'find_cast(id)'
  describe 'find_review(id)'
end
