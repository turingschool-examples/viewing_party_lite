# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'methods' do
    it 'returns top rated movies' do
      x = MovieFacade.get_top_rated

      x.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it 'can search for movies' do
      x = MovieFacade.search('Titanic')

      expect(x).to be_a(Array)
      expect(x.first.name).to eq('Titanic 666')
      expect(x.last.name).to eq('Titanic: The Shocking Truth')
      expect(x.first.avg).to eq(5.6)
      expect(x.first.id).to eq(945_657)
    end

    it 'can retrieve movie data' do
      x = MovieFacade.movie_data(945_657)

      expect(x.name).to eq('Titanic 666')
      expect(x.avg).to eq(5.6)
      expect(x.runtime).to eq(91)
      expect(x.genres).to be_a(Array)
      expect(x.summary).to be_a(String)
      expect(x.cast).to be_a(Hash)
      expect(x.reviews).to be_a(Hash)
    end
  end
end
