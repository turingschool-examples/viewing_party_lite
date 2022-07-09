require 'rails_helper'

RSpec.describe Review do
  it "exists and has attributes" do
    data = {
      author: "reviewer",
      content: "movie review"
    }
    review = Review.new(data)

    expect(review).to be_a Review
    expect(review.author).to eq "reviewer"
    expect(review.content).to eq "movie review"
  end
end
