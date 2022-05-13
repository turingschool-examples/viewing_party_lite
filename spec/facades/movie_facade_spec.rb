require "rails_helper"

RSpec.describe "MovieFacade" do
  it "can return array of movie_info for a given movie", :vcr do
    movies = MovieFacade.create_top_rated_movies

    expect(movies).to be_a Array

    expect(movies).to be_all Movie
  end
end
