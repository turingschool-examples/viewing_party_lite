require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attrs = {
      author: 'BananaSam27',
      content: "This movie rocks!",
    }

    review = Review.new(attrs)
    expect(review.author_name).to eq("BananaSam27")
    expect(review.author_review).to eq('This movie rocks!')
  end
end

