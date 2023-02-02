require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/movie_details_godfather238.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/cast_details.json'))
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/reviews.json'))
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'))
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&include_adult=false&query=The%20Matrix")
      .to_return(status: 200, body: File.read('spec/fixtures/search_for_the_matrix.json'))
  end

  it 'can return a movie object' do
    response = MovieService.movie_details(238)
    # require 'pry'; binding.pry
    expect(response).to be_a(Hash)
    expect(response[:id]).to eq(238) 
    expect(response[:title]).to be_a(String)
    expect(response[:vote_average]).to be_a(Float)
    expect(response[:genres][0][:name]).to be_a(String)
    expect(response[:runtime]).to be_a(Integer)
  end

  it 'can return a movie cast' do
    response = MovieService.actors(238)
    actor = response[:cast][0] 
    # require 'pry'; binding.pry
    expect(response[:cast]).to be_a(Array)
    expect(actor[:name]).to be_a(String)
    expect(actor[:character]).to be_a(String)
  end
end