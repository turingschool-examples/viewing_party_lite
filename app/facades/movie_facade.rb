class MovieFacade
  def self.create_top_rated_movies
    json = MovieService.movie_titles_by_rating

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.take(40)
  end

  def self.create_search_movies(query)
    json = MovieService.movie_by_keyword(query)

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.take(40)
  end

  # def self.create_movie_cast_info(movie_id)
  #   json = MovieService.movie_cast_info(movie_id)
  #
  #   json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end
  #
  # def self.create_movie_details
  #   json = MovieService.movie_details
  #
  #   json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end
  #
  # def self.create_movie_reviews
  #   json = MovieService.movie_reviews
  #
  #   json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end
  #
  # def self.create_movie_picture
  #   json = MovieService.movie_picture
  #
  #   json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end

  def movie_show(movie_id)
    production = MovieService.movie_details(movie_id)
    cast = MovieService.cast(movie_id)
    reviews = MovieService.reviews(movie_id)
    pictures = MovieService.pictures(movie_id)
    movie = MovieInfo.new(production, cast, reviews, picture)
  end

  def movies_data(data)
    data[:results].map do |result|
      Movie.new(id: result[:id], title: result[:original_title], vote_average: result[:vote_average])
    end
  end
end
