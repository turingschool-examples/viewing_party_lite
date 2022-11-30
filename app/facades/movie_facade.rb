class MovieFacade
  def self.posters(movie)
    json = MovieService.posters_en_us(movie)
    Poster.new(json)
  end

  def self.top_rated
    json = MovieService.top_rated_movies

    top_rated_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.searched_movies(keyword)
    json = MovieService.search(keyword)

    searched_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_by_id(id)
    json = MovieService.find_by_id(id)

    Movie.new(json)
  end

  def self.movie_cast(id)
    json = MovieService.find_movie_cast(id)

    MovieCast.new(json)
  end

  def self.movie_reviews(id)
    json = MovieService.find_movie_reviews(id)

    MovieReviews.new(json)
  end
end