require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "relationships" do
    it {have_many(:parties)}
  end

  describe '.instance methods' do
    before(:each) do
      @movie_1 = Movie.create!(api_id: 550)
    end

    describe '.show_poster' do
      it 'shows poster image of movie' do

        expect(@movie_1.get_poster).to eq("https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
      end
    end

    describe '.get_info' do
      it 'gets all api attributes' do
        VCR.use_cassette('fight_club_api') do
          expect(@movie_1.get_info).to be_an_instance_of(MovieCall)
          expect(@movie_1.get_info.title).to eq("Fight Club")
        end
      end
    end
  end
end
