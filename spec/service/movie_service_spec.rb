require 'rails_helper'

RSpec.describe 'movie service' do
  it 'can connect to the movie db and return top rated' do
    top_rated = MovieService.top_rated
    expect(top_rated).to be_a Hash
    expect(top_rated[:results]).to be_a Array
    expect(top_rated[:results][0]).to include(:title, :vote_average)
  end
end
