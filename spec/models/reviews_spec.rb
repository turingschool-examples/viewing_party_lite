require 'rails_helper'

describe Review do
  it 'exists' do
    review = Review.new({:author => "ZeBlah", :content => "One of the great masters of the anime art."})
    expect(review).to be_an_instance_of(Review)
  end

  it 'attributes' do
    review = Review.new({:author => "ZeBlah", :content => "One of the great masters of the anime art."})
    expect(review.author).to eq("ZeBlah")
    expect(review.content).to eq("One of the great masters of the anime art.")
  end
end
