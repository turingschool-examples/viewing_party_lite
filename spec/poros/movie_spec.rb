require 'rails_helper'


RSpec.describe "Movie" do 
  it "has title and vote average" do 
      movie = Movie.new(title: "Cheese", vote_average: 8.2)
    expect(movie).to be_an_instance_of Movie
    expect(movie.title).to eq("Cheese")
    expect(movie.vote_average).to eq(8.2)
  end 
end 