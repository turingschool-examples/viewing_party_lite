require 'rails_helper'

RSpec.describe Reviews do
  it 'exists and has attributes' do
    reviews = Reviews.new({ results: [{ author: 'i_like_movies', content: '10/10 amazing movie!' }], total_results: 1 })

    expect(reviews).to be_an_instance_of(Reviews)
    expect(reviews.results[0][:author]).to eq('i_like_movies')
    expect(reviews.results[0][:content]).to eq('10/10 amazing movie!')
    expect(reviews.total_results).to eq(1)
  end
end
