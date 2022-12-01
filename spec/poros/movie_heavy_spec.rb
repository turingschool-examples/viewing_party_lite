# frozen_string_literal: true

require 'rails_helper'
require './app/poros/movie_heavy'

RSpec.describe MovieHeavy do
  before :each do
    @godfather_genres = [{ id: 18,
                           name: 'Drama' },
                         { id: 80,
                           name: 'Crime' }]
    @godfather_hash = { id: 238,
                        title: 'The Godfather',
                        vote_average: 8.715,
                        runtime: 175,
                        genres: @godfather_genres,
                        overview: 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.' }
    VCR.use_cassette('movie_credits') do
      VCR.use_cassette('movie_reviews') do
        @godfather = MovieHeavy.new(@godfather_hash)
      end
    end
  end

  describe 'initialize' do
    it 'is an instance of its class' do
      expect(@godfather).to be_a MovieHeavy
    end
    it 'has readable attributes' do
      expect(@godfather.id).to eq(@godfather_hash[:id])
      expect(@godfather.movie_title).to eq(@godfather_hash[:title])
      expect(@godfather.vote_average).to eq(@godfather_hash[:vote_average])
      expect(@godfather.runtime).to eq(@godfather_hash[:runtime])
      expect(@godfather.genres).to eq(@godfather_genres)
      expect(@godfather.first_10_cast_members).to be_a Array
      expect(@godfather.reviews[:results]).to be_a Array
    end
  end
end
