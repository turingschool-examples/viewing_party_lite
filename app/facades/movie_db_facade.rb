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
      SearchedMovies.new(searched_movies_data)
    end 
  end
end
