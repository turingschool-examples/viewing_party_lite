class MovieFacade
  def self.movie_search(keywords)
    json = MovieService.search(keywords)
    @movies = json[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.top_rated_movies
    json = MovieService.top_rated
    @movies = json[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end