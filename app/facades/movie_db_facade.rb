class MovieDbFacade
  def self.top_20_movies
    json = MovieDbService.top_rated_movies_data
    json[:results].map do |film_data|
      { id: film_data[:id],
        title: film_data[:title],
        vote_average: film_data[:vote_average] }
    end
  end

  def self.search_movies(keyword)
    json = MovieDbService.movies_search_data(keyword)
    json[:results].map do |film_data|
      { id: film_data[:id],
        title: film_data[:title],
        vote_average: film_data[:vote_average] }
    end
  end

  def self.find_by_movie_id(id) # creates movie object
    json = MovieDbService.find_movie_by_id_data(id)
    Movie.new(json)
  end

  def self.reviews_by_movie(movie_id) # creates review objects in an array
    json = MovieDbService.find_movie_reviews_data(movie_id)
    json[:results].map { |review_data| Review.new(review_data) }
  end

  def self.cast(movie_id)
    json = MovieDbService.cast_data(movie_id)
    json[:cast].first(10).map { |cast_data| CastMember.new(cast_data) }
  end

  def self.poster(movie_id)
    json = MovieDbService.image_data(movie_id)
    json[:posters].first[:file_path]
  end
end
