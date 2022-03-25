require 'rails_helper'

RSpec.describe Reviews do
  it 'has attributes', :vcr do
    data = {
      author: 'Gunnar',
      content: 'Dark and Gritty. Two thumbs up!'
    }

    mov_review = Reviews.new(data)

    expect(mov_review).to be_a(Reviews)
    expect(mov_review.author).to eq('Gunnar')
    expect(mov_review.review).to eq('Dark and Gritty. Two thumbs up!')
  end
end
