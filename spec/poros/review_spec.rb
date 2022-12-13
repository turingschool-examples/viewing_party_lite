# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  describe 'initialize' do
    it 'has readable attributes' do
      VCR.use_cassette('movie_reviews') do
        data = MoviesService.reviews(238)[:results].first
        @review = Review.new(data)
      end

      expect(@review).to be_a Review
      expect(@review.author).to be_a String
      expect(@review.content).to be_a String
    end
  end
end
