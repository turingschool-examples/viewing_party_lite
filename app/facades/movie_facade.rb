class MovieFacade
  def self.top_movies
    json = MovieService.top_movies

    json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.search_for_movie(search_name)
    json = MovieService.search_for_movie(search_name)

    json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_info(movie_id)
    json = MovieService.movie_info(movie_id)


    Movie.new(json)
  end

  def self.reviews(movie_id)
    json = MovieService.reviews(movie_id)

    json[:results].map do |data|
      Review.new(data)
    end
  end

  def self.cast(movie_id)
    json = MovieService.cast(movie_id)

    json[:cast].map do |data|
      Cast.new(data)
    end
  end
end
