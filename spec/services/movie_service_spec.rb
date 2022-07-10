require 'rails_helper' 

RSpec.describe MoviesService do
  it '#get_top_rated retrieves data and parses response', :vcr do
    parsed_json = MoviesService.get_top_rated
    expect(parsed_json).to be_a Array
    movie = parsed_json.first
    expect(movie).to be_a Hash 
    expect(movie).to include :title, :vote_average
    expect(movie[:title]).to be_a String
    expect(movie[:vote_average]).to be_a Float
  end
  
  it '#find_movies retrieves data and parses response', :vcr do
    keyword = "Apple"
    parsed_json = MoviesService.find_movies(keyword)

    expect(parsed_json).to be_a Array
    
    movie = parsed_json.first
    expect(movie).to be_a Hash 

    parsed_json.each do |movie|
        expect(movie[:title]).to be_a String
        expect(movie[:title]).to include(keyword)
    end
  end
  
  it '#get_movie returns a hash of a single movies attributes', :vcr do
      parsed_json = MoviesService.get_movie(550)
      expect(parsed_json).to be_a Hash 
      expect(parsed_json[:title]).to eq("Fight Club")
  end
      

  it '#get_movie_review returns an array of hashes', :vcr do
    movie_id = 550
    parsed_json = MoviesService.get_movie_reviews(movie_id)
    expect(parsed_json).to be_a Array 
    movie = parsed_json.first
    expect(movie[:content]).to be_a String
    expect(movie).to include(:author, :content)
  end
end