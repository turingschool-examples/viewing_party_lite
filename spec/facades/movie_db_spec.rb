require 'rails_helper'

RSpec.describe MovieDBFacade do
  it 'returns an array of objects', :vcr do
    array_of_top_movie_objects = MovieDBFacade.top_movies
    
    expect(array_of_top_movie_objects).to be_a Array 
    expect(array_of_top_movie_objects).to be_all TopMovie 
  end
end