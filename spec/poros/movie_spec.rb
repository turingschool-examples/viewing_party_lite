require 'rails_helper'

RSpec.describe Movie do
  let!(:movie_data) do
    { id: 1, original_title: 'Test Title', vote_average: 5.5, runtime: 120, genres: [{name: "Drama"}, {name: "Action"}],
      overview: 'a film depicting a story', cast: [{ name: 'actor', character: 'role' }, { name: 'second actor', character: 'supporting role' }], results: [{ author: 'reviewer', review: 'good' }, { author: 'other reviewer', review: 'not the best' }], poster_path: 'imagelocation' }
  end
  let!(:movie) { Movie.new(movie_data) }
  describe 'attributes' do
    it 'has readable attributes' do
      expect(movie.id).to eq 1
      expect(movie.title).to eq 'Test Title'
      expect(movie.vote_average).to eq 5.5
      expect(movie.runtime).to eq 120
      expect(movie.genres).to eq "Drama, Action" 
      expect(movie.overview).to eq "a film depicting a story"
      #expect(movie.cast).to be_a  
      #expect(movie.reviews).to eq [{ author: 'reviewer', review: 'good' }, { author: 'other reviewer', review: 'not the best' }]
      expect(movie.image_path).to eq "https://image.tmdb.org/t/p/w500/imagelocation"
    end
  end

  describe '#genres' do
    it 'returns a list of comma separated genres' do
      expect(movie.genres).to be_a String
      expect(movie.genres).to eq "Drama, Action"
    end
  end

  describe '#review_total' do
    it 'returns the total number of reviews a movie has' do
      expect(movie.review_total).to eq 2
    end
  end
end
