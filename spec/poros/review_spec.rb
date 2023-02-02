require 'rails_helper'

RSpec.describe Review do
  it 'exists and contains attributes' do
    @review = Review.new({author: "Arnold Swarzenegger", content: "Floor was sticky"})
    expect(@review.author).to eq("Arnold Swarzenegger")
    expect(@review.content).to eq("Floor was sticky")
    expect(@review).to be_instance_of(Review)
  end
end
