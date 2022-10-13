# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies do
  describe 'instantiation' do
    let(:data) do
      {
        genre_ids: [18, 80],
        id: 238,
        overview: 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
        title: 'The Godfather',
        vote_average: 8.7
      }
    end

    it 'instantiates described class' do
      movie = Movies.new(data)
      expect(movie).to be_instance_of(Movies)
      expect(movie.title).to eq('The Godfather')
      expect(movie.id).to eq(238)
      expect(movie.vote_average).to eq(8.7)
      expect(movie.overview).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
      expect(movie.genre).to eq([18, 80])
    end
  end
end
