class MovieFacade

  def self.top_20_rated
    parsed_json = MovieService.top_rated
    parsed_json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search(query)
    results = MovieService.search(query)

    results.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
