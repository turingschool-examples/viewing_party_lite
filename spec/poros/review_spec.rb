require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    rev_data = {
      author: 'Chut Backworth',
      author_details: { rating: '9.8' },
      content: 'movie is good'
    }

    review = Review.new(rev_data)

    expect(review).to be_a Review
    expect(review.author).to eq('Chut Backworth')
    expect(review.rating).to eq('9.8')
    expect(review.content).to eq('movie is good')
  end
end
