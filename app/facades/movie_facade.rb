class MovieFacade

  def self.search(keyword)
    response = MovieService.search_for_movie(keyword)
    Movie.new(response)
  end

  def self.find_top_rated_movies
    response = MovieService.top_rated

    response.map do |data|
      Movie.new(data)
    end
  end

  def self.cast_members(movie_id)
    response = MovieService.cast_members(movie_id)

    response.map do |data|
      CastMember.new
    end.take(10)
  end
end
