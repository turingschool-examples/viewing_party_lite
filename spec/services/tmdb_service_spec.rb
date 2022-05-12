require 'rails_helper'

RSpec.describe TmdbService do
  let!(:service) { TmdbService.new }

  it 'exists' do
    expect(service).to be_a TmdbService
  end
  it 'gets data for top 20 movies', :vcr do
    results = service.top20
    expect(results).to be_an Array
    expect(results.count).to eq(20)
    expect(results[0][:title]).to eq('The Shawshank Redemption')
    expect(results[0][:vote_average]).to eq(8.7)
  end

  it 'gets movies from keyword search', :vcr do
    results = service.search('man')

    expect(results).to be_a Hash
    expect(results[:results].count).to eq(20)
    expect(results[:results][0][:title]).to eq("The King's Man")
    expect(results[:results][0][:vote_average]).to eq(6.9)
  end
end
