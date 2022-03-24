require 'rails_helper'

  RSpec.describe MovieService do
    let(:movie_deets) { MovieService.movie_deets(5244) }
    let(:casts) { MovieService.cast(5244) }
    let(:reviews) { MovieService.reviews(5244) }
    it 'establishes a connection for movie_deets' do
      VCR.use_cassette('movie_results', re_record_interval: 7.days) do
      expect(movie_deets).to be_a(Hash)
      #binding.pry
      expect(movie_deets[:genres]).to be_a(Array)
      expect(movie_deets[:title]).to be_a(String)
      expect(movie_deets[:id]).to be_a(Integer)
      expect(movie_deets[:overview]).to be_a(String)
      expect(movie_deets[:runtime]).to be_a(Integer)
      expect(movie_deets[:vote_average]).to be_a(Float)
      #binding.pry

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
