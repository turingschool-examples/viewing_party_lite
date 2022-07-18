require 'cgi'
class MoviesFacade

  def self.top_movies
    movies = []
    parsed_json = MovieService.top_rated
    parsed_json[:results].each do |movie|
      movies << Movie.new(movie)
    end
    return movies
  end

  def self.search(movie_name)
    formatted_movie = CGI.escape(movie_name)
    movies = []
    parsed_json = MovieService.search_movie_by_name(formatted_movie)
    parsed_json[:results].each do |movie|
      movies << Movie.new(movie)
    end
    return movies
  end

  def self.info(movie_id)
    parsed_json = MovieService.get_movie_info(movie_id)
  end

end
