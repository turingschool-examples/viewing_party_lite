class MovieFacade
  def self.movies_searched(query)

    json = MovieService.searched_movies(query)
    @movie_info = json[:results].map do |info|
      MovieResults.new(info)
    end
  end

  def self.top_movies
    json = MovieService.top_rated_movies

    @top_movie_details = json.map do |movie_details|
      MovieResults.new(movie_details)
    end
  end
end
