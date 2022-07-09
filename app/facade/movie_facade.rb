class MovieFacade

  def self.get_top_rated
    top_movies = []
    top_movies_1 = MovieService.get_top_rated(1)
    top_movies_2 = MovieService.get_top_rated(2)
    top_movies_1[:results].each do |movie|
      top_movies << movie
    end
    top_movies_2[:results].each do |movie|
      top_movies << movie
    end
    top_movie_poros = []
    top_movies.each do |movie|
      top_movie_poros << Movie.new(movie)
    end
    return top_movie_poros
  end

  def self.search(title)
    movie_search = []
    movie_poros = []
    movie_search_1 = MovieService.find_movies(title, 1)
    movie_search_2 = MovieService.find_movies(title, 2)
    movie_search_1[:results].each do |movie|
      movie_search << movie
    end
    movie_search_2[:results].each do |movie|
      movie_search << movie
    end
    movie_search.each do |movie|
      movie_poros << Movie.new(movie)
    end
    return movie_poros
  end

  def self.movie_data(id)
    MovieData.new(MovieService.movie_data(id))
  end

end
