require 'rails_helper'

RSpec.describe MoviesFacade do
  it 'turns the data in to poros', :vcr do
    expected = MoviesFacade.top_movies

    expect(expected.class).to eq Array
    expect(expected).to be_all Movie
  end

  it 'turns the search data in to poros', :vcr do
    expected = MoviesFacade.search("the shawshank redemption")
    expect(expected.class).to eq Array
    expect(expected).to be_all Movie
  end
end
