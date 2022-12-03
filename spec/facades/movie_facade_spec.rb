require 'rails_helper'

RSpec.describe MovieFacade do 
  it "gets data for top rated movies", :vcr do
    movies = MovieFacade.create_top_movies 
    expect(movies[0]).to be_a Movie 
    expect(movies.count).to eq(40)
    expect(movies[1].title).to be_a(String)
  end
  it "gets data for search", :vcr do
    movies = MovieFacade.movie_search("Impossible Things")
    expect(movies[0]).to be_a Movie 
    expect(movies.count).to eq(2)
    expect(movies[1].title).to eq("Impossible Things")
  end

  it "gets data for movie reviews", :vcr do 
    reviews = MovieFacade.create_reviews("19404")
    expect(reviews.count).to eq(1)
  end
end