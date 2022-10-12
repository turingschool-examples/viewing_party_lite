require 'rails_helper'

RSpec.describe 'Movie Result Poros' do
  it 'exists and has attributes' do
    data = {title: 'Coraline', vote_average: 10}

    results = MovieResult.new(data)

    expect(results).to be_a MovieResult
    expect(results.title).to eq('Coraline')
    expect(results.vote_average).to eq(10)
  end
end