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
    array = top_1_through_20_movies
    top_21_through_40_movies.each do |movie_object|
      array << movie_object
    end
    array
  end

end