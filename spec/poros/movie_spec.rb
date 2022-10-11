require 'rails_helper'

RSpec.describe "Movie" do
  describe "exists" do
    it 'exists and has attributes' do
      # movie_data = MovieService.get
      fight_club = File.read("spec/fixtures/fight_club.json")
      fc = JSON.parse(fight_club, symbolize_names: true)

      # fc[:title]
      # #title
      # fc[:vote_average]
      # # vote_average
      # fc[:runtime]
      # #runtime
      # fc[:genres].map { |g| g[:name] }
      # #genre
      # fc[:overview]
      # #summary
      # fc[:credits][:cast].take(10).map { |cast_mem| [cast_mem.name, cast_mem.character]}
      # #cast
      # fc[:reviews][:results].map { |review| [review[:author], review[:content]] }
      # #reviews
      # fc[:images][:posters].first[:file_path]
      # #image_link

      movie_data = JSON.parse(fight_club, symbolize_names: true)
      movie = Movie.new(movie_data)

      expect(movie).to be_a Movie
      expect(movie.title).to be_a String
      expect(movie.vote_average).to be_a Float
      expect(movie.runtime).to be_a Integer
      expect(movie.genre).to be_a Array
      expect(movie.genre.first).to be_a String
      expect(movie.summary).to be_a String
      expect(movie.cast).to be_a Array
      expect(movie.cast.length).to be <= 10
      expect(movie.cast.first).to be_a CastMember
      expect(movie.reviews).to be_a Array
      expect(movie.reviews.first).to be_a Review
      expect(movie.image_link).to be_a String
    end
  end
end