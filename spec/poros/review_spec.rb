require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attrs = {
      author: 'The Godfather',
      content: 'fewugfvdwibvvb'
    }

    review = Review.new(attrs)

    expect(review).to be_a Review
    expect(review.author).to eq('The Godfather')
    expect(review.content).to eq('fewugfvdwibvvb')
  end
end
