require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    data = { author: "Greg", content: "some review" }

    review = Review.new(data)

    expect(review).to be_a(Review)
    expect(review.author).to eq("Greg")
    expect(review.content).to eq("some review")
  end
end
