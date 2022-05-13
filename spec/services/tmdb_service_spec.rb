require 'rails_helper'

RSpec.describe TmdbService do
  it 'gets data for top 20 movies', :vcr do
    results = TmdbService.top20
    expect(results).to be_an Array
    expect(results.count).to eq(20)
    expect(results[0][:title]).to eq('The Shawshank Redemption')
    expect(results[0][:vote_average]).to eq(8.7)
  end

  it 'gets movies from keyword search', :vcr do
    results = TmdbService.search('man')

    expect(results).to be_a Hash
    expect(results[:results].count).to eq(20)
    expect(results[:results][0][:title]).to eq("The King's Man")
    expect(results[:results][0][:vote_average]).to eq(6.9)
  end

  it 'movie_details', :vcr do
    # VCR.use_cassette('movie_details') do
    movie_details = TmdbService.movie_details(438_631)

    expect(movie_details).to be_instance_of(Hash)
    expect(movie_details.first).to be_instance_of(Array)
    expect(movie_details[:id]).to eq(438_631)
    expect(movie_details[:title]).to eq('Dune')
    expect(movie_details[:runtime]).to eq(155)
    expect(movie_details[:vote_average]).to eq(7.9)
    expect(movie_details[:genres]).to eq([{ id: 878, name: 'Science Fiction' },
                                          { id: 12, name: 'Adventure' }])
    expect(movie_details[:overview]).to be_instance_of(String)
  end

  it 'movie_cast', :vcr do
    credits = TmdbService.movie_cast(438_631)

    expect(credits).to be_a Hash
    expect(credits[:cast]).to be_a Array
  end

  it 'movie_review', :vcr do
    reviews = TmdbService.movie_review(438_631)

    expect(reviews).to be_a Hash
    expect(reviews[:results]).to be_a Array
  end
end
