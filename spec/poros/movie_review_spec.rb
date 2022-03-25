require 'rails_helper'

RSpec.describe MovieReview do
  it 'exists' do
    data = { results: [
    {
      author: 'Gimly',
      review_content: 'I like bathman'
    },
    {
      author: 'Rob',
      review_content: 'I also like bathman'
    }]
  }

    review = data[:results].map do |movie_data|
      MovieReview.new(movie_data)
    end

    expect(review.first).to be_a MovieReview
    expect(review.first.author).to eq 'Gimly'
    expect(review.count).to eq 2
  end
end
