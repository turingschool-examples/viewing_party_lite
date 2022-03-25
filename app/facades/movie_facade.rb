class MovieFacade

  def self.search(keyword)
    response = MovieService.search_for_movie(keyword)
    response.map do |data|
      Movie.new(data)
    end.take(40)
  end

  def self.find_top_rated_movies
    response = MovieService.top_rated

    response.map do |data|
      Movie.new(data)
    end
  end

  def self.cast_members(movie_id)
    response = MovieService.cast_members(movie_id)
    # require 'pry'; binding.pry

    response.map do |data|
      Movie.new(data)
    end
  end
end
