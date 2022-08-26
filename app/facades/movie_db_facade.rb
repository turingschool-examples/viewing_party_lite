class MovieDBFacade
  def self.top_movies
    parsed1 = MovieDBService.top_rated_movies_page_1
    parsed2 = MovieDBService.top_rated_movies_page_2
    @top_rated_movies = []
    parsed1[:results].each {|movie_data| @top_rated_movies << TopMovie.new(movie_data)}
    parsed2[:results].each {|movie_data| @top_rated_movies << TopMovie.new(movie_data)}
    return @top_rated_movies
  end

  def self.searched_movies(search)
    parsed_json = MovieDBService.find_movie(search)
    parsed_json[:results].map do |searched_movies_data|
      SearchedMovie.new(searched_movies_data)
    end
  end

  def self.movie(movie_id)
    movie = MovieDBService.get_movie(movie_id)
    MovieResult.new(movie)
  end

  def self.cast_members(movie_id)
    cast = MovieDBService.get_cast(movie_id)
    cast[0..9].map {|data| CastMember.new(data)}
  end

  def self.movie_reviews(movie_id)
    reviews_array = []
    movie_reviews = MovieDBService.get_reviews(movie_id)
    movie_reviews.each do |review|
      reviews_array << MovieReview.new(review)
    end
    reviews_array
  end
end
