require 'rails_helper'

describe 'Movie Facade' do
  it 'can see the movie details' do
    VCR.use_cassette('fight_club') do
      fight_club = MovieFacade.movie_details(550)
      expect(fight_club).to be_a(Movie)

    end
  end
end