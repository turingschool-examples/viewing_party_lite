class MoviesFacade
  def self.top_rated
    json = MoviesService.top_rated_movies

    @movies = json[:results].map do |movie_data|
      MovieLite.new(movie_data)
    end
  end

  def self.search(query)
    json = MoviesService.search(query)

    @movies = json[:results].first(20).map do |movie_data|
      MovieLite.new(movie_data)
    end
  end

  def self.movie_poster_url(movie_id)
    json = MoviesService.details(movie_id)

    "https://image.tmdb.org/t/p/w500/#{json[:poster_path]}"
  end

  def self.get_movie_lite(movie_id) 
    json = MoviesService.details(movie_id)

    MovieLite.new(json)
  end
end