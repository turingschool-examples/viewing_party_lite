require 'rails_helper'

RSpec.describe TmdbService do
  let(:top_rated) { TmdbService.top_rated_movies(1) }
  let(:review) { TmdbService.reviews(100) }
  let(:keyword) { TmdbService.keyword('Godfather', 1) }
  let(:details) { TmdbService.details(278) }
  let(:credits) { TmdbService.credits(278) }

  it 'establishes a connection for top rated movies', :vcr do
    expect(top_rated).to be_a(Hash)
    expect(top_rated[:results]).to be_a(Array)
    expect(top_rated[:results].first[:title]).to be_a(String)
    expect(top_rated[:results].first[:title]).to eq('Your Eyes Tell')
  end

  it 'establishes a connection for keyword', :vcr do
    expect(keyword).to be_a(Hash)
    expect(keyword[:results]).to be_a(Array)
    expect(keyword[:results].first[:original_title]).to be_a(String)
    expect(keyword[:results].first[:original_title]).to eq('The Godfather')
  end

  it 'establishes a connection for reviews', :vcr do
    expect(review).to be_a(Hash)
    expect(review[:results]).to be_a(Array)
    expect(review[:results].first[:author]).to be_a(String)
    expect(review[:results].first[:author]).to eq('BradFlix')
  end

  it 'establishes a connection for details', :vcr do
    expect(details).to be_a(Hash)
    expect(details[:budget]).to be_a(Integer)
    expect(details[:original_title]).to be_a(String)
    expect(details[:original_title]).to eq('The Shawshank Redemption')
  end

  it 'establishes a connection for credits', :vcr do
    expect(credits).to be_a(Hash)
    expect(credits[:cast]).to be_a(Array)
    expect(credits[:cast].first[:original_name]).to be_a(String)
    expect(credits[:cast].first[:original_name]).to eq('Tim Robbins')
  end
end
