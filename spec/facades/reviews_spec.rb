# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsFacade do
  describe 'class methods' do
    describe 'reviews' do
      it 'returns Review objects' do
        VCR.use_cassette('movie_reviews') do
          @reviews = ReviewsFacade.reviews(238)
        end

        @reviews.each do |review|
          expect(review).to be_a Review
          expect(review.author).to be_a String
          expect(review.content).to be_a String
        end
      end
    end
  end
end
