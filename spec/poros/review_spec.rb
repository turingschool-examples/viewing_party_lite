# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  it 'exists and has attributes' do
    fake_data = {
      id: 1,
      author: 'Sandys M',
      content: 'Angel face stole the show'

    }
    review = Review.new(fake_data)

    expect(review).to be_a(Review)
    expect(review.author).to eq('Sandys M')
    expect(review.content).to eq('Angel face stole the show')
  end
end
