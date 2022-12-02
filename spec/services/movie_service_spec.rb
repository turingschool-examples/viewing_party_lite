require "rails_helper"

RSpec.describe MovieService do 
  describe 'instance methods' do 
    describe '#movie_details' do 
      it 'gets movie details', :vcr do 
        search = MovieService.new.movie_details(128)

        expect(search).to be_a(Hash)

        expect(search).to have_key :poster_path
        expect(search[:poster_path]).to be_a(String)

        expect(search).to have_key :title
        expect(search[:title]).to be_a(String)

        expect(search).to have_key :runtime
        expect(search[:runtime]).to be_a(Integer)

        expect(search).to have_key :genres
        expect(search[:genres]).to be_a(Array)

        expect(search).to have_key :vote_average
        expect(search[:vote_average]).to be_a(Float)

        expect(search).to have_key :overview
        expect(search[:overview]).to be_a(String)

        expect(search).to have_key :id
        expect(search[:id]).to be_a(Integer)
      end
    end

    describe '#top_rated_movies' do 
      it 'returns the top 20 rated movies', :vcr do 
        search = MovieService.new.top_rated_movies 
        results = search[:results]
        movie = results.first

        expect(search).to be_a(Hash)
        expect(results).to be_a(Array)
        expect(results.count).to eq(20)
        expect(movie).to be_a(Hash)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Numeric)
      end
    end

    describe '#config_base_path' do 
      it 'returns configuration data', :vcr do 
        search = MovieService.new.config_base_path
        
        expect(search).to be_a(Hash)
        expect(search[:images]).to be_a(Hash)
        expect(search[:images][:base_url]).to be_a(String)
      end
    end

    describe '#movies_keyword' do 
      it 'returns data about movies that match keyword(s)', :vcr do
        search = MovieService.new.movies_keyword('Princess space')
        results = search[:results]
        movie = results.first

        expect(search).to be_a(Hash)
        expect(results).to be_a(Array)
        expect(movie).to be_a(Hash)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Numeric)
      end
    end

    describe '#movie_cast' do 
      it 'returns the cast/crew for the movie', :vcr do 
        search = MovieService.new.movie_cast(128)
        cast = search[:cast]
        actor = cast.first

        expect(search).to be_a(Hash)
        expect(cast).to be_a(Array)
        expect(actor).to be_a(Hash)

        expect(actor).to have_key :name
        expect(actor[:name]).to be_a(String)

        expect(actor).to have_key :character
        expect(actor[:character]).to be_a(String)
      end
    end

    describe '#movie_reviews' do 
      it 'returns the movie reviews details', :vcr do 
        search = MovieService.new.movie_reviews(128)
        reviews = search[:results]
        review = reviews.first
        author_details = review[:author_details]

        expect(search).to be_a(Hash)
        expect(reviews).to be_a(Array)
        expect(review).to be_a(Hash)
        expect(author_details).to be_a(Hash)

        expect(review).to have_key :author
        expect(review[:author]).to be_a(String)

        expect(author_details).to have_key :username
        expect(author_details[:username]).to be_a(String)
        
        expect(author_details).to have_key :avatar_path
        expect(author_details[:avatar_path]).to be_a(String)

        expect(author_details).to have_key :rating
        expect(author_details[:rating]).to be_a(Numeric)
      end
    end
  end
end