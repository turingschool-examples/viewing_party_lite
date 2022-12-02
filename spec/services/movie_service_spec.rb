require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods', :vcr do
    describe '#top_movies' do
      it 'returns top rated movies' do
        top_movies = MovieService.top_movies
        expect(top_movies).to be_a(Hash)
        expect(top_movies[:results]).to be_a(Array)
        movie = top_movies[:results][0]

        expect(movie).to have_key(:title)
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key(:vote_average)
        expect(movie[:vote_average]).to be_a(Float)

        expect(movie).to have_key(:overview)
        expect(movie[:overview]).to be_a(String)

        expect(movie).to have_key(:vote_count)
        expect(movie[:vote_count]).to be_a(Integer)

        expect(movie).to have_key(:genre_ids)
        expect(movie[:genre_ids]).to be_a(Array)
      end
    end 
    
    describe '#search_movies' do
      it 'returns movies with matching keywords' do
        search_movies = MovieService.search_movie("Nemo")
        expect(search_movies).to be_a(Hash)
        expect(search_movies[:results]).to be_a(Array)
        movie = search_movies[:results][0]

        expect(movie).to have_key(:title)
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key(:vote_average)
        expect(movie[:vote_average]).to be_a(Float)

        expect(movie).to have_key(:overview)
        expect(movie[:overview]).to be_a(String)

        expect(movie).to have_key(:vote_count)
        expect(movie[:vote_count]).to be_a(Integer)

        expect(movie).to have_key(:genre_ids)
        expect(movie[:genre_ids]).to be_a(Array)
      end
    end

    describe '#reviews' do
      it 'returns reviews' do
        reviews = MovieService.reviews(238)
        expect(reviews).to be_a(Hash)
        expect(reviews[:results]).to be_a(Array)
        review = reviews[:results][0]

        expect(review).to have_key(:author)
        expect(review[:author]).to be_a(String)

        expect(review).to have_key(:content)
        expect(review[:content]).to be_a(String)

        expect(reviews).to have_key(:id)
        expect(reviews[:id]).to be_a(Integer)

        expect(reviews).to have_key(:total_results)
        expect(reviews[:total_results]).to be_a(Integer)
      end
    end
  end
end