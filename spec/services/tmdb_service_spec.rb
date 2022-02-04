require 'rails_helper'

RSpec.describe TmdbService do
  it 'establishes a connection' do
    review = TmdbService.reviews(100)
        
    expect(review).to be_a(Hash)
    expect(review[:results]).to be_a(Array)
    expect(review[:results].first[:author]).to be_a(String)
    expect(review[:results].first[:author]).to eq("BradFlix")
  end
end