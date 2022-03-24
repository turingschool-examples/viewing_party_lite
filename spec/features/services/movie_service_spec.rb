require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    @ms = MovieService.movie(402)
  end
  it 'will return a hash of data', :vcr do
    expect(@ms).to be_a Hash
  end
  it 'will return the desired keys', :vcr do
    expect(@ms).to have_key(:id)
    expect(@ms[:id]).to be_a Integer
    expect(@ms).to have_key(:title)
    expect(@ms[:title]).to be_a String
    expect(@ms).to have_key(:genres)
    expect(@ms[:genres]).to be_a Array
    expect(@ms).to have_key(:overview)
    expect(@ms[:overview]).to be_a String
    expect(@ms).to have_key(:vote_average)
    expect(@ms[:vote_average]).to be_a Float
    expect(@ms).to have_key(:runtime)
    expect(@ms[:runtime]).to be_a Integer
    expect(@ms).to have_key(:runtime)
    expect(@ms[:runtime]).to be_a Integer
    expect(@ms).to have_key(:poster_path)
    expect(@ms[:poster_path]).to be_a String
  end
  it 'will return reviews', :vcr do
    reviews = MovieService.reviews(402)
    expect(reviews).to be_a Hash
    expect(reviews[:results].first).to have_key(:author)
    expect(reviews[:results].first).to have_key(:content)
  end
  it 'will return credits', :vcr do
    credits = MovieService.credits(402)
    expect(credits).to be_a Array
    expect(credits.first).to be_a Hash
    expect(credits.first[:name]).to eq('Michael Douglas')
    expect(credits.first[:character]).to eq('Det. Nick Curran')
  end
  it 'will search for a movie', :vcr do
    search = MovieService.search('Pi')
    expect(search[:results].first).to have_key(:id)
  end
end
