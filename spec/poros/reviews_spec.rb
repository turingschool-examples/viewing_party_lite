require 'rails_helper'

RSpec.describe Reviews do
  describe 'Reviews Poro', :vcr do
    before :each do
      @reviews_array = MovieFacade.reviews_poro(550)
    end

    it 'instantiates' do
      @reviews_array.each do |review|
        expect(review).to be_a(Reviews)
      end
    end

    it 'returns an array of review objects with author and content as strings' do
      @reviews_array.each do |review|
        expect(review.author).to be_a(String)
        expect(review.content).to be_a(String)
      end
    end
  end
end
