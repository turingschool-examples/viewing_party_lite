require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#get_movies" do
      it "returns movie data", :vcr do
        search = MovieService.get_movies('lion')
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie = search[:results].first

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_an(Integer)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)
      end
    end

    context '#movie_by_id' do
      it 'returns a single movie', :vcr do
        movie = MovieService.movie_by_id(550)
        expect(movie).to be_a Hash

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_an Array

        expect(movie).to have_key :poster_path
        expect(movie[:poster_path]).to be_a String

        expect(movie).to have_key :vote_count
        expect(movie[:vote_count]).to be_a Integer
      end
    end

    context '#cast' do
      it 'returns the cast members', :vcr do 
        cast_members = MovieService.cast(550)
        expect(cast_members).to be_a Hash
        expect(cast_members[:cast]).to be_an Array
        expect(cast_members[:cast]).to all(be_a(Hash))
        expect(cast_members[:cast].first).to have_key :name
        expect(cast_members[:cast].first[:name]).to be_a String
      end
    end 

    context '#reviews' do
      it "returns a movie's reviews information", :vcr do
        reviews = MovieService.reviews(550)
        expect(reviews).to be_a Hash
        expect(reviews[:results]).to be_an Array
        expect(reviews[:results].first).to have_key :author
        expect(reviews[:results].first[:author]).to be_a String
        expect(reviews[:results].first).to have_key :author
        expect(reviews[:results].first[:author]).to be_a String
      end
    end
  end
end