require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    json_response_1= File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_1)
    json_response_2 = File.read('spec/fixtures/the_godfather_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_2)
    json_response_3 = File.read('spec/fixtures/the_godfather_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_3)
    json_response_4 = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['movie_api_key']}&include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=1000").
      to_return(status: 200, body: json_response_4)
    json_response_5 = File.read('spec/fixtures/movies_with_green.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=Green&page=1&include_adult=false").
      to_return(status: 200, body: json_response_5)
  end

  it '#find_movie' do 
    expect(MovieFacade.find_movie(238)).to be_a(Movie)
  end
  it '#find_cast' do
    expect(MovieFacade.find_cast(238)).to be_a(Array)
  end
  it '#find_reviews' do
    expect(MovieFacade.find_reviews(238)).to be_a(Array)
  end
  it '#find_movies by top rated' do 
    expect(MovieFacade.find_movies("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['movie_api_key']}&include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=1000")).to be_a(Array)
  end
  it '#find_movies by top search' do 
    expect(MovieFacade.find_movies("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&include_adult=false&language=en-US&page=1&query=Green")).to be_a(Array)
  end
end