require 'rails_helper'

RSpec.describe MinMovie, :vcr do
  let!(:min_movie) { MovieFacade.movie_card(550) }
  describe 'MinMovie object' do
    it 'initializes correctly' do
      expect(min_movie).to be_instance_of(MinMovie)
    end

    it 'can store and read info from the service' do
      expect(min_movie.title).to eq("Fight Club")
      expect(min_movie.vote_avg).to be_a(Float)
      expect(min_movie.img_path).to be_a(String)
      expect(min_movie.img_path.include?('/'))
      expect(min_movie.id).to eq(550)
    end
  end
end