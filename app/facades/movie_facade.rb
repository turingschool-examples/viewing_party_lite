class MovieFacade
  def self.search_movies(title, num = 1)
    parsed_json = MovieService.movies(title, num)
      parsed_json[:results].map do |movie_json|
        MoviePoros.new(movie_json)
      end
  end

  def self.search_trending
    parsed_json = MovieService.trending_movies
    parsed_json[:results].map do |movie_json|
      MoviePoros.new(movie_json)
    end
  end
end