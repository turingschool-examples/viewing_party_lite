# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'instance methods' do
    describe '#top_rated' do
      it 'returns the top rated movis', :vcr do
        expect(MovieFacade.new(550).top_rated[0].title).to eq('20th Century Girl')
        expect(MovieFacade.new(550).top_rated[1].title).to eq('The Godfather')
      end
    end

    describe '#searched_movies' do
      it 'returns movies with the select word in its title', :vcr do
        expect(MovieFacade.new('princess').searched_movies[0].title).to eq('The Princess')
        expect(MovieFacade.new('princess').searched_movies[1].title).to eq('The Princess')
      end
    end

    describe '#movie_by_id' do
      it 'returns detales for the select movie by id', :vcr do
        expect(MovieFacade.new(550).movie_by_id.title).to eq('Fight Club')
      end
    end

    describe '#cast' do
      it 'returns detales for the select movie by id', :vcr do
        expect(MovieFacade.new(550).cast[0]).to eq('Edward Norton as The Narrator')
      end
    end

    describe '#reviews' do
      it 'returns detales for the select movie by id', :vcr do
        test_string = 'Goddard: Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.'
        expect(MovieFacade.new(550).reviews[0]).to eq(test_string)
      end
    end
  end
end
