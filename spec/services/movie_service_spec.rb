require 'rails_helper'

RSpec.describe MovieService do 
  it "gets data for top rated movies", :vcr do 
    movies = MovieService.get_top_rated
    # require 'pry'; binding.pry 
    expect(movies[0]).to be_a(Hash)
    expect(movies.count).to eq(40)
    expect(movies[0][:title]).to be_a(String)
    expect(movies[0][:vote_average]).to be_a(Float)
    # expect(movies).to have_http_status(200)
  end
  it "gets data for search results", :vcr do 
    movies = MovieService.get_movie_search("Impossible Things")
    # require 'pry'; binding.pry 
    expect(movies[0]).to be_a(Hash)
    expect(movies.count).to eq(2)
    expect(movies[0][:title]).to be_a(String)
    expect(movies[0][:vote_average]).to be_a(Float)
    # expect(movies).to have_http_status(200)
  end
  it "gets data for cast", :vcr do 
    movie_cast = MovieService.get_cast(550)
    expect(movie_cast[:cast]).to be_a(Array)
    expect(movie_cast[:cast].count).to eq(79)
    expect(movie_cast[:cast][0][:name]).to be_a(String)
  end
  it "gets data for reviews", :vcr do 
    movie_reviews = MovieService.get_reviews(550)
    expect(movie_reviews[:results][0]).to be_a(Hash)
    expect(movie_reviews[:results].count).to eq(7)
    expect(movie_reviews[:results][0][:author]).to be_a(String)
  end
end


#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API