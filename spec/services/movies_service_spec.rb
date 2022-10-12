require 'rails_helper'

RSpec.describe MoviesService do
    it 'can return top 20 movie results' do
        search = MoviesService.top_20
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results].length).to eq 20
        movie_data = search[:results].first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)
    end

    it 'can return details of movie' do
        search = MoviesService.movie_details(238)
        expect(search).to be_a Hash
        expect(search[:id]).to eq 238
        expect(search).to have_key(:runtime)
        expect(search[:runtime]).to be_a(Integer)
        expect(search[:runtime]).to eq 175

        expect(search).to have_key(:overview)
        expect(search[:overview]).to be_a(String)

        expect(search).to have_key(:title)
        expect(search[:title]).to be_a(String)

        expect(search).to have_key(:vote_average)
        expect(search[:vote_average]).to be_a(Float)

        expect(search).to have_key(:genres)
        expect(search[:genres]).to be_an Array
    end

    it 'can return credits of movie' do
        search = MoviesService.movie_credits(238)
        expect(search[:cast]).to be_an Array
        actor_data = search[:cast].first

        expect(actor_data).to have_key :name
        expect(actor_data[:name]).to be_a(String)
    end

    it 'can return images from the movie' do
        search = MoviesService.movie_images(238)
        
        expect(search).to be_a(Hash)
        expect(search).to have_key :posters
        expect(search[:posters]).to be_an Array

        poster = search[:posters].first
        expect(poster).to have_key :file_path
        expect(poster[:file_path]).to be_a String
    end

    it 'can return search results' do
        search = MoviesService.search_results("The Evil Dead")

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        result = search[:results].first
        expect(result).to have_key :id
        expect(result[:id]).to be_an Integer
        expect(result).to have_key :title
        expect(result[:title]).to be_a String
    end

    it 'can return reviews' do 
        search = MoviesService.movie_reviews(238)
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        review = search[:results].first
        expect(review).to have_key :author
        expect(review[:author]).to be_a String
        expect(review[:author_details]).to have_key :rating
        expect(review[:author_details][:rating]).to be_a Float
        expect(review).to have_key :content
        expect(review[:content]).to be_a String
    end
end