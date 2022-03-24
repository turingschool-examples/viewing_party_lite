require 'rails_helper'

  RSpec.describe MovieService do
    let(:movie_deets) { MovieService.movie_deets(5244) }
    let(:casts) { MovieService.cast(5244) }
    let(:reviews) { MovieService.reviews(5244) }
    
    
    it "can call for movies", :vcr do 
      movie = "Aliens"
      response = MovieService.call_for_a_movie(movie)
      expect(response).to have_content("Aliens")
    end 

    it "can call for top movies", :vcr do 
      response = MovieService.call_for_top_20_movies
      expect(response).to have_content("The Shawshank Redemption")
      expect(response).to have_content(8.7)
    end 
  

    it 'establishes a connection for movie_deets' do
      VCR.use_cassette('movie_results', re_record_interval: 7.days) do
      expect(movie_deets).to be_a(Hash)
      expect(movie_deets[:genres]).to be_a(Array)
      expect(movie_deets[:title]).to be_a(String)
      expect(movie_deets[:id]).to be_a(Integer)
      expect(movie_deets[:overview]).to be_a(String)
      expect(movie_deets[:runtime]).to be_a(Integer)
      expect(movie_deets[:vote_average]).to be_a(Float)
      end
    end

    it 'establishes a connection for cast' do
      VCR.use_cassette('cast_results', re_record_interval: 7.days) do
        expect(casts[:cast]).to be_a(Array)
        expect(casts[:cast][0]).to be_a(Hash)
        expect(casts[:cast][0][:name]).to be_a(String)
      end
    end

    it 'establishes a connection for cast' do
      VCR.use_cassette('review_results', re_record_interval: 7.days) do
        expect(reviews[:results]).to eq([])
      end
    end

end

