require 'rails_helper'

RSpec.describe MoviesFacade do
  it 'turns the data in to poros' do
    expected = MoviesFacade.top_movies

    expect(expected).to eq Array
    expect(expected).to be_all Movie
  end
end
