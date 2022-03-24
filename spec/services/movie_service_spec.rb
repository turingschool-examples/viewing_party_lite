require 'rails_helper'

RSpec.describe 'Movie Services', type: :feature do

  it "can call for movies", :vcr do 
     movie = "Aliens"
     response = MovieService.call_for_a_movie(movie)
     expect(response).to have_content("Aliens")
  end 

  it "can call for top movies", :vcr do 
    response = MovieService.call_for_top_20_movies
    expect(response).to have_content("The Shawshank Redemption")
    expect(response).to have_content(8.7)
  end 
end