require 'rails_helper'

RSpec.describe MovieDBFacade do
  it 'returns an array of objects', :vcr do
    array_of_top_movie_objects = MovieDBFacade.top_movies
    
    expect(array_of_top_movie_objects).to be_a Array 
    expect(array_of_top_movie_objects).to be_all TopMovie 
  end

  it 'returns an array of objects containing the searched word(s)', :vcr do
    array_of_movies_matching_searched_keyword = MovieDBFacade.searched_movies("Shawshank")
    
    expect(array_of_movies_matching_searched_keyword).to be_a Array 
    expect(array_of_movies_matching_searched_keyword).to be_all XXX 
  end
end