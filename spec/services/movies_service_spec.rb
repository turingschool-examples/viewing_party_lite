require 'rails_helper'

RSpec.describe MoviesService do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/top_rated_movies_response.json'), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/discover_movies_response.json'), headers: {})
  
    stub_request(:get, "https://api.themoviedb.org/3/movie/497?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/green_mile/details_response.json'), headers: {})
  
    stub_request(:get, "https://api.themoviedb.org/3/movie/497/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/green_mile/credits_response.json'), headers: {})
  end

  it 'can return the searched movie data' do 
    response = MoviesService.movie_search 

    expect(response).to be_a Hash
    expect(response[:results]).to be_a Array
    response[:results].each do |movie_result_data|
      expect(movie_result_data).to have_key(:id)
      expect(movie_result_data).to have_key(:title)
      expect(movie_result_data).to have_key(:overview)
      expect(movie_result_data).to have_key(:vote_average)
      expect(movie_result_data).to have_key(:vote_count)
    end
  end

  it 'can return the top rated data' do 
    response = MoviesService.top_rated 
    
    expect(response).to be_a Hash
    expect(response[:results]).to be_a Array
    response[:results].each do |movie_result_data|
      expect(movie_result_data).to have_key(:id)
      expect(movie_result_data).to have_key(:title)
      expect(movie_result_data).to have_key(:overview)
      expect(movie_result_data).to have_key(:vote_average)
      expect(movie_result_data).to have_key(:vote_count)
    end 
  end

  it 'can return the specific movie' do 
    response = MoviesService.find_movie_details(497)

    expect(response).to be_a Hash 
    expect(response).to have_key(:id)
    expect(response).to have_key(:title)
    expect(response).to have_key(:overview)
    expect(response).to have_key(:vote_average)
    expect(response).to have_key(:vote_count)
  end

  it 'can return the movie credits data' do 
    response = MoviesService.find_movie_credits(497)

    expect(response).to be_a Hash 
    expect(response).to have_key(:id)
    expect(response).to have_key(:cast)
  end
end
