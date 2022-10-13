require 'rails_helper'

RSpec.describe Reviews do
  describe 'Reviews Poro', :vcr do
    before :each do
      @reviews = MovieFacade.reviews_poro(550)
    end

    it 'instantiates' do
      expect(@reviews).to be_a(Reviews)
    end

    it 'results method returns an array of hashes' do
      expect(@reviews.results).to be_a(Array)
      expect(@reviews.results[0]).to be_a(Hash)
      expect(@reviews.results[0][:author]).to be_a(String)
    end
  end
end