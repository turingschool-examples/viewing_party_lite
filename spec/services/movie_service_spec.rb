require 'rails_helper'

RSpec.describe MovieService do
  it 'gets data for 40 top rated movies', :vcr do
    data = MovieService.get_top_movies

    expect(data).to be_an(Array)
    expect(data.count).to eq(40)
    expect(data[0][:title]).to eq('The Shawshank Redemption')
    expect(data[0][:vote_average]).to eq(8.7)
  end
end