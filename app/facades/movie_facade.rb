# frozen_string_literal: true

class MovieFacade
  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)
    movie_detail = MovieDetail.new(movie_info)
  end

  def self.top_cast(id)
    MovieService.get_cast(id)[:cast][0..9].map do |data|
      Actor.new(data)
    end
  end

  def self.top_rated
    MovieService.top_rated_movies[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end

  def self.movie_search(query)
    MovieService.search(query)[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end

  def self.get_dashboard_image(id)
    MovieService.get_movie(id)[:backdrop_path]
  end

  def self.reviews(id)
    MovieService.get_reviews(id)[:results].map do |review|
      Review.new(review)
    end
  end
end
