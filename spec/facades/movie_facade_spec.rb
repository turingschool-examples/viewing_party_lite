require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#get_movies' do
    it 'returns an array of movies', :vcr do
      title = "fight"
      array_of_movies = MovieFacade.get_movies(title)
  
      expect(array_of_movies).to be_a Array
      expect(array_of_movies.first.class).to be(Movie)
      expect(array_of_movies).to all( be_a(Movie) )
      # Are we supposed to be getting 40 results here? Or did we decide on 20?
    end
  end
end