require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#search_movies" do
      it 'returns movie data by title' do
        json_response = File.read('spec/fixtures/search_movies.json')
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["movie_api_key"]}&query=Test").
          to_return(status: 200, body: json_response)

        search = MovieService.search_movies("Test")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        test_data = search[:results].first

        expect(test_data).to have_key :title
        expect(test_data[:title]).to be_a(String)

        expect(test_data).to have_key :vote_average
        expect(test_data[:title]).to be_a(String)
      end
    end
    context "#top_rated" do
      it 'returns top_rated movies' do
        json_response = File.read('spec/fixtures/top_rated_movies.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}").
          to_return(status: 200, body: json_response)

        search = MovieService.top_rated
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        test_data = search[:results].first

        expect(test_data).to have_key :title
        expect(test_data[:title]).to be_a(String)

        expect(test_data).to have_key :vote_average
        expect(test_data[:title]).to be_a(String)
      end
    end
    context "#movie_details" do
      it 'returns movie details' do
        details_response = File.read('spec/fixtures/shawshank_details.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV["movie_api_key"]}").
          to_return(status: 200, body: details_response)

        credits_response = File.read('spec/fixtures/shawshank_credits.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/278/credits?api_key=#{ENV["movie_api_key"]}").
          to_return(status: 200, body: credits_response)

        reviews_response = File.read('spec/fixtures/shawshank_reviews.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/278/reviews?api_key=#{ENV["movie_api_key"]}").
          to_return(status: 200, body: reviews_response)

        search = MovieService.movie_details(278)
        expect(search).to be_a Hash
        expect(search[:details]).to be_an Hash
        expect(search[:credits]).to be_an Hash
        expect(search[:reviews]).to be_an Hash
      end
    end
  end
end
