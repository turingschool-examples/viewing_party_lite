class MovieFacade

  def self.top_rated
    MovieService.top_rated[:results].map do |data|
      MovieResult.new(data)
    end
  end

  def self.movie_search(movie_name)
    movie_data = MovieService.search(movie_name)[:results]
    movie_data.map { |movie_hash| MovieResult.new(movie_hash) }
  end
end
