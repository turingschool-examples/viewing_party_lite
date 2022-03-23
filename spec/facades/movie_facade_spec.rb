require 'rails_helper'

RSpec.describe MovieFacade do

  it 'creates movie poros for top rated movies', :vcr do
    movies = MovieFacade.top_rated_movies

    movies.each do |movie|
      expect(movie).to be_an_instance_of(Movie)
    end
  end
end
