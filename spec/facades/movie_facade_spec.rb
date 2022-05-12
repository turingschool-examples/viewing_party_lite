require 'rails_helper'

RSpec.describe MovieFacade do
  let!(:facade) { MovieFacade.new }

  it 'exists' do
    expect(facade).to be_a MovieFacade
  end

  it 'initializes a TmdbService' do
    expect(facade.service).to be_a TmdbService
  end

  it 'collects data for to_20 movies', :vcr do
    results = facade.top_movies_data
    expect(results).to be_an Array
    expect(results[0][:title]).to eq('The Shawshank Redemption')
    expect(results[0][:vote_average]).to eq(8.7)
  end

  it 'creates 20 top movies objects' do
    json = File.read('spec/fixtures/top_20.json')
    data = JSON.parse(json, symbolize_names: true)[:results]
    results = facade.top20(data)
    expect(results).to be_an Array
    expect(results[0]).to be_a MovieDetail
    expect(results[0].title).to eq('The Shawshank Redemption')
    expect(results[0].vote_average).to eq(8.7)
  end

  it 'creates 40 movies from valid search', :vcr do
    results = facade.search('man')

    expect(results).to be_an Array
    expect(results[0]).to be_a MovieDetail
    expect(results.count).to eq(40)
    expect(results[0].title).to eq("The King's Man")
    expect(results[0].vote_average).to eq(6.9)
  end

  it "details", :vcr do
    # VCR.use_cassette('movie_details') do
    movie_details = facade.details(438631)
    # expect(movie_details).to be_instance_of(MovieDetail)
    expect(movie_details).to be_instance_of(Hash)
    expect(movie_details.first).to be_instance_of(Array)
    expect(movie_details[:id]).to eq(438631)
    expect(movie_details[:title]).to eq("Dune")
    expect(movie_details[:runtime]).to eq(155)
    expect(movie_details[:vote_average]).to eq(7.9)
    expect(movie_details[:genres]).to eq([{ :id => 878, :name => "Science Fiction" },
                                          { :id => 12, :name => "Adventure" }])
    expect(movie_details[:overview]).to be_instance_of(String)
  end
end
