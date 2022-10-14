require 'rails_helper'


RSpec.describe Movie do
  it 'exists and displays attributes correctly' do
    VCR.use_cassette("movie_data", :allow_playback_repeats => true) do
      movie_data = MovieService.request(550)
      movie = Movie.new(movie_data)
      expect(movie).to be_instance_of(Movie)
      expect(movie.title).to eq("Fight Club")
      expect(movie.vote_avg).to eq(8.433)
      expect(movie.runtime).to eq(139)
      expect(movie.summary).to be_a(String)
      expect(movie.id).to eq(550)
      expect(movie.genres).to eq(["Drama", "Thriller", "Comedy"])
    end
  end
end