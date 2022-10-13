class MovieFacade
  
  def self.top_1_through_20_movies
    json = MovieService.get_rated_movies_asc(1)

    page_1 = json[:results].map do |movie_data|
      movie_object = MovieService.get_movie_data(movie_data[:id])
      Movie.new(movie_object)
    end
  end

  def self.top_21_through_40_movies
    json = MovieService.get_rated_movies_asc(2)

    page_2 = json[:results].map do |movie_data|
      movie_object = MovieService.get_movie_data(movie_data[:id])
      Movie.new(movie_object)
    end
  end

  def self.top_40_movies
    top_40 = top_1_through_20_movies
    top_21_through_40_movies.each do |movie_object|
      top_40 << movie_object
    end
    top_40
  end

  def self.search(search_params)
    json = MovieService.search(search_params.parameterize(separator: '+'))
    json[:results].map do |movie_data|
      movie_object = MovieService.get_movie_data(movie_data[:id])
      Movie.new(movie_object)
    end
  end

end