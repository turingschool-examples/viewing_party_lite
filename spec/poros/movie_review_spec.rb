require 'rails_helper'

RSpec.describe MovieReview do
  it 'exists' do
    attributes = {
      author: "Jennifer",
      content: "Great movie"
    }

    review = MovieReview.new(attributes, 1, 2)
    expect(review).to be_instance_of(MovieReview)
    expect(review.id).to eq(1)
    expect(review.author).to eq("Jennifer")
    expect(review.content).to eq("Great movie")
    expect(review.number_reviews).to eq(2)
  end
end