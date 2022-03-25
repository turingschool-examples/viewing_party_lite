require 'rails_helper'
require './app/poros/review'

RSpec.describe Review do
  it 'builds a cast object when data is passed in' do
    data = {
      author: "Angry Fan",
      content: "What a disgrace!",
    }
    @review = Review.new(data)

    expect(@review).to be_an_instance_of(Review)
    expect(@review.author).to eq("Angry Fan")
    expect(@review.content).to eq("What a disgrace!")
  end
end
