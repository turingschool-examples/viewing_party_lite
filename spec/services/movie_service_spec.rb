require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe 'request' do
      it 'returns a single movies data with just an id argument' do
        VCR.use_cassette("request_id_only_argument", :allow_playback_repeats => true) do
          single_movie_data = MovieService.request(550)
         
          expect(single_movie_data).to be_a(Hash)
          expect(single_movie_data["spoken_languages"]).to be_a(Array) 
          expect(single_movie_data["popularity"]).to be_a(Float)
          expect(single_movie_data["genres"].first["id"]).to be_a(Integer)
        end
      end

      it 'returns data on movies with just a path as an argument' do
        VCR.use_cassette("request_path_only_argument", :allow_playback_repeats => true) do
          popular_data = MovieService.request('', "popular")
          results = popular_data["results"]
          
          expect(popular_data.first).to be_a(Array)
      
          expect(results).to be_a(Array)
          expect(results.first).to be_a(Hash)
          expect(results.first["id"]).to be_a(Integer)
          expect(results.last["genre_ids"].first).to be_a(Integer)
          expect(results.first["original_title"]).to be_a(String)
        end
      end
    end
  end
end