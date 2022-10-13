require 'rails_helper'

RSpec.describe MovieFacade do
  it 'can retrieve movie_data', :vcr do
    movie_data = MovieFacade.movie_data(8)

    expect(movie_data).to be_a(MovieInfo)
  end
end