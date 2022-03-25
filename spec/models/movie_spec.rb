require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "relationships" do
    it {have_many(:parties)}
  end

  describe '.instance methods' do
    describe '.show_poster' do
      it 'shows poster image of movie' do
        movie_1 = Movie.create!(api_id: 550)
        expect(movie_1.get_poster).to eq("https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
      end
    end
  end
end
