# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '.top_rated' do
      it 'returns the top rated movis' do
        VCR.insert_cassette 'top rated'
        expect(described_class.top_rated[0].title).to eq('The Godfather')
        VCR.eject_cassette
      end
    end

    describe '#searched_movies' do
      it 'returns movies with the select word in its title' do
        VCR.insert_cassette 'searches'
        expect(described_class.searched_movies('princess').first.title).to eq('The Princess')
        VCR.eject_cassette
      end
    end

    describe '#movie_by_id' do
      it 'returns detales for the select movie by id' do
        VCR.insert_cassette 'movie_show'
        expect(described_class.movie_by_id(550).title).to eq('Fight Club')
        VCR.eject_cassette
      end
    end

    describe '#cast' do
      it 'returns detales for the select movie by id' do
        VCR.insert_cassette 'movie_show'
        expect(described_class.cast(550)[0]).to eq('Edward Norton as The Narrator')
        VCR.eject_cassette
      end
    end

    describe '#reviews' do
      it 'returns detales for the select movie by id' do
        VCR.insert_cassette 'movie_show'
        test_string = 'Goddard: Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.'
        expect(described_class.reviews(550).first).to eq(test_string)
        VCR.eject_cassette
      end
    end
  end
end
