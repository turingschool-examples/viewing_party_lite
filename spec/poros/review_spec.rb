require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    data = {author: "Rich", content: "some words"}
    review = Review.new(data)
    expect(review).to be_a Review
    expect(review.author).to eq("Rich")
    expect(review.content).to eq("some words")
  end
end
