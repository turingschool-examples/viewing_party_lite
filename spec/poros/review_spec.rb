require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
      attributes = {
        author: "The Author",
        content: "The Best Review Ever"
      }

      review = Review.new(attributes)

      expect(review).to be_an_instance_of(Review)
      expect(review.author).to eq("The Author")
      expect(review.content).to eq("The Best Review Ever")
  end
end
