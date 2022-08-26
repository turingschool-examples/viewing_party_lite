require 'rails_helper'

RSpec.describe 'MovieFacade', :vcr do
  it 'makes service call and returns an ' do
    movie = MovieFacade.service(278)

    expect(movie).to be_a(Movie)
  end
end