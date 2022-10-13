require 'rails_helper'

RSpec.describe MovieService do
  describe 'returns a movie by ID' do

    it '#movie_by_id' do 

      VCR.use_cassette('fight_club') do
        fight_club = MovieService.movie_by_id(550)

        expect(fight_club).to be_a(Hash)
        expect(fight_club).to have_key(:original_title)
        expect(fight_club).to have_key(:poster_path)
      end
    end
  end
end
