require 'rails_helper'

RSpec.describe Details do
  describe 'Details Poros', :vcr do
    before :each do
      @details = MovieFacade.details_poro(550)
    end

    it 'insantiates' do
      expect(@details).to be_a(Details)
    end

    it 'returns title as a string' do
      expect(@details.title).to be_a(String)
    end

    it 'returns summary as a string' do
      expect(@details.summary).to be_a(String)
    end

    it 'returns vote_average as a float' do
      expect(@details.vote_average).to be_a(Float)
    end

    it 'returns runtime as an integer' do
      expect(@details.runtime).to be_a(Integer)
    end

    it 'genres_names_array returns array of genre names as strings' do
      expect(@details.genres_names_array).to be_a(Array)
      @details.genres_names_array.each do |name|
        expect(name).to be_a(String)
      end
    end
  end
end
