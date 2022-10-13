require 'rails_helper'

RSpec.describe ReviewFacade do
  describe '#get_review_info' do
    it 'returns an array of reviews for a particular movie', :vcr do
      array_of_reviews = ReviewFacade.get_review_info(550)
  
      expect(array_of_reviews).to be_a Array
      expect(array_of_reviews.first.class).to be(Review)
      expect(array_of_reviews).to all( be_a(Review) )
    end
  end
end