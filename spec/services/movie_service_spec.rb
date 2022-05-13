require 'rails_helper'

RSpec.describe MovieService do
  it 'makes an API callcfor top rated movies' do
    MovieFacade.top_rated_movies
  end

  it 'makes a search in the movie database' do
    MovieFacade.search_movies("Godfather")
  end
end
