require 'rails_helper'

RSpec.describe MovieService do
  it 'gets json and parses into hash', :vcr do

    expect(MovieService.top_movies).to be_a Hash
  end
end
