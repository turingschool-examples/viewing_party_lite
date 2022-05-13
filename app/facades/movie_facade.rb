class MovieFacade

  def self.movie_list(query)
    json = MovieService.movie_results(query)
    json[:results].map do |result|
      Movie.new(result)
    end
  end

  def self.single_movie(id)
    json = MovieService.find_with_id(id)
    Movie.new(json)
  end

  def self.single_movie_credits(id)
    json = MovieService.find_credits_with_id(id)
    Movie.new(json)
  end
end
