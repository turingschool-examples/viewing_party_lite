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

    expect(response).to be_a(Hash)
    expect(response[:id]).to eq(238)
    expect(response[:title]).to be_a(String)
    expect(response[:vote_average]).to be_a(Float)
    expect(response[:genres][0][:name]).to be_a(String)
    expect(response[:runtime]).to be_a(Integer)
  end

  it 'can return movie cast' do
    response = MovieService.actors(238)
    actor = response[:cast][0]

    expect(response[:cast]).to be_a(Array)
    expect(actor[:name]).to be_a(String)
    expect(actor[:character]).to be_a(String)
  end

  it 'can return movie reviews' do
    response = MovieService.review_details(238)
    review = response[:results][0]

    expect(response).to be_a(Hash)
    expect(review[:author]).to be_a(String)
    expect(review[:author_details][:rating]).to be_a(Float)
    expect(review[:content]).to be_a(String)
  end

  it 'can return top rated movies' do
    response = MovieService.discover_movie('top rated')
    top_movie = response[:results][0]

    expect(response[:results].count).to eq (20)
    expect(top_movie[:title]).to be_a(String)
    expect(top_movie[:vote_average]).to be_a(Float)
  end

  it 'can return movies based on search' do
    response = MovieService.discover_movie('The Matrix')
    search_movie = response[:results][0]

    expect(response[:results].count).to be <= 20
    expect(search_movie[:title]).to be_a(String)
    expect(search_movie[:vote_average]).to be_a(Float)
  end
end
