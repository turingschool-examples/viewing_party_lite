class MovieFacade

  def self.create_top_movies
    movies = MovieService.get_top_movies
    movies[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.create_search_movie(search)
    results = MovieService.search_movie(search)
    results.map do |movie|
      Movie.new(movie)
    end
  end

  def self.create_find_movie(id)
    movie_find = MovieService.find_movie(id)
    movie_find.map do |data|
      Movie.new(data)
    end
  end
end
