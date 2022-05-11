require "rails_helper"

describe Review do
  it "exists and has attributes" do
    attr = {
      author: "Author 1",
      content: "Movie sucked."
    }
    review = Review.new(attr)

    expect(review).to be_a Review
    expect(review.author).to eq("Author 1")
    expect(review.content).to eq("Movie sucked.")
  end
end
