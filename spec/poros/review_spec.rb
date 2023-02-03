require 'rails_helper'

RSpec.describe Review do
  
  it 'exist with attributes' do
    review = Review.new({author: "billy bob", content: "this is the content"})
    
    expect(review).to be_a(Review)
    expect(review.author).to eq("billy bob")
    expect(review.content).to eq("this is the content")
  end
  
  it '#content_strip' do
    review = Review.new({author: "billy bob", content: "this is the content"})

    expect(review.content_strip("this’ is’ the’ content’")).to eq("this' is' the' content'")
  end
  
end