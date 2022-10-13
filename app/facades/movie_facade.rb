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

  def self.cast(id)
    json = MovieService.cast(id)
    json[:cast][0..9].map { |actor| actor[:name] }
  end

  def self.get_top20_movies
    json = MovieService.get_top20_movies
    json[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
