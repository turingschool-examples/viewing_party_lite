require 'rails_helper'

RSpec.describe MovieFacade do 
  it 'makes services call and returns an array of member objects', :vcr do
    movies = MovieFacade.top_rated_array

    expect(movies).to be_a(Array)
    expect(movies).to be_all(Movie)
  end
end