require 'rails_helper'

RSpec.describe MovieFacade do
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

  it 'returns a movie' do
    movie = MovieFacade.movie_details(238)

    expect(movie).to be_a Movie
  end
end
  