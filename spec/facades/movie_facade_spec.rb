require 'rails_helper'

RSpec.describe MovieFacade do
  describe "#methods" do
    describe '#get_movie' do
      it 'gets movie when passed api_id' do
        VCR.use_cassette('fight_club_api') do
          @movie = MovieFacade.get_movie('550')

          expect(@movie).to be_an_instance_of(MovieCall)
          expect(@movie.title).to eq("Fight Club")
        end
      end
    end

    describe '#get_10_cast' do
      it 'gets 10 cast members from movie' do
        VCR.use_cassette('fight_club_10_cast') do
          @cast = MovieFacade.get_10_cast('550')

          expect(@cast).to be_a(Array)
          expect(@cast.length).to be(10)

          @cast.each do |cast|
            expect(cast).to be_an_instance_of(Cast)
          end

          expect(@cast.first.name).to eq("Edward Norton")
          expect(@cast.first.character).to eq("The Narrator")
        end
      end
    end

    describe '#get_reviews' do
      it 'gets all reviews from movie' do
        VCR.use_cassette('fight_club_reviews') do
          @reviews = MovieFacade.get_reviews('550')

          expect(@reviews).to be_a(Array)
          expect(@reviews.length).to be(7)

          @reviews.each do |review|
            expect(review).to be_an_instance_of(Review)
          end

          expect(@reviews.first.author).to eq("Goddard")
        end 
      end
    end

    describe '#top_twenty' do
      it 'gets top 20 rated movies' do
        VCR.use_cassette('top_20_api') do
          @movies = MovieFacade.top_twenty

          expect(@movies.first.title).to eq('The Shawshank Redemption')
          expect(@movies.count).to eq(20)
        end
      end
    end

  end
end
