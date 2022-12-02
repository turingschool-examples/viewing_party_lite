require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  # before(:each) do
  #   @party_1 = Party.create!(movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: DateTime.new(2022,12,20,18,30,00))
  #   @party_2 = Party.create!(movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: DateTime.new(2022,12,27,20,00,00))
  # end

  describe 'class methods' do 
    describe '#movie_title(movie_id)' do 
      it '- returns the movie title of a given movie id' do
        expect(MovieService.movie_details(550)[:title]).to eq("Fight Club")
      end

      it '- returns the movie image of a given movie id' do
        expect(MovieService.movie_details(550)[:poster_path]).to eq("/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
      end    
    end
  end

end