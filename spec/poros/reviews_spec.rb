require 'rails_helper'

RSpec.describe Reviews do
  it 'exists with attributes' do
    godfather_reviews = Reviews.new({results: [{author: "saianna", content: "I love this movie"}], total_results: 2})

    expect(godfather_reviews).to be_an_instance_of(Reviews)
    expect(godfather_reviews.paired_reviews[0][:author]).to eq("saianna")
    expect(godfather_reviews.paired_reviews[0][:content]).to eq("I love this movie")
    expect(godfather_reviews.total_results).to eq(2)
  end
end
