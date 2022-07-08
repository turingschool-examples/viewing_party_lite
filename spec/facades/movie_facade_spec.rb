require 'rails_helper'

RSpec.describe MovieFacade do
  it 'sorts through movie data' do
    movies = MovieFacade.get_movie

    expect(movies).to be_an Array
    expect(movies).to be_all Movie
  end
end