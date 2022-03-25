require 'rails_helper'

RSpec.describe MovieService do
  it 'will return a hash of top movies', :vcr do
    top = MovieService.top_rated

    expect(top).to be_a Hash
    expect(top).to have_key(:results)
    expect(top[:results]).to be_a Array
    expect(top[:results].first).to have_key(:id)
    expect(top[:results].count).to eq(20)
  end
end
