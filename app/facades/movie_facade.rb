# frozen_string_literal: true

require './app/poros/movie'
class MovieFacade
  def self.movie(movie_id)
    @movie = Movie.new(MovieService.movie(movie_id))
  end

  def self.cast(movie_id)
    complete_cast = []
    MovieService.credits(movie_id).each do |cast|
      complete_cast << CastMember.new(cast)
    end
    @top_cast = complete_cast.first(10)
  end

  def self.reviews(movie_id)
    @reviews = []
    MovieService.reviews(movie_id)[:results].each do |review|
      @reviews << Review.new(review)
    end
    @reviews
  end

  def self.top_rated
    @top_rated = []
    MovieService.top_rated[:results].each do |data|
      top_movie = MovieService.movie(data[:id])
      @top_rated << Movie.new(top_movie)
    end
      @top_rated
  end
end
