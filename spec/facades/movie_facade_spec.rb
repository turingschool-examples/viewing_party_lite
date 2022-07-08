require 'rails_helper'

RSpec.describe MovieFacade do
  it 'sorts through movie data' do
    movies = MovieService.get_top_movies[:results]
    
    expect(movies).to be_an Array
    # expect(movies).to be_all Movie
  end
end