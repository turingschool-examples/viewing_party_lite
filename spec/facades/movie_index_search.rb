require 'rails_helper'

RSpec.describe 'MovieIndexSearchResultFacade', :vcr do
  it 'makes service call and returns an ' do
    movies = MovieIndexSearchResultFacade.service("Toy Story")

    expect(movies).to be_a(Array)
    expect(movies).to be_all(MovieIndexResult)
  end
end