class MovieFacade 
  def self.get_movies(title)
    json = MovieService.get_movies(title)
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
  
  def self.movie_by_id(id)
    json = MovieService.movie_by_id(id)
    Movie.new(json)
  end
end
