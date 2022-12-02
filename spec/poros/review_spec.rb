require 'rails_helper'

RSpec.describe Review do
  it 'exists' do 
    details = {
      name: "James",
      username: "dadmanjames",
      avatar_path: "dadmanjames/12345",
      rating: 7.9
    }

    attrs = {
      author: "James",
      author_details: details
    }

    review = Review.new(attrs)

    expect(review).to be_a Review
    expect(review.author).to eq("James")
    expect(review.name).to eq("James")
    expect(review.username).to eq("dadmanjames")
    expect(review.avatar_path).to eq("dadmanjames/12345")
    expect(review.rating).to eq(7.9)
  end
end