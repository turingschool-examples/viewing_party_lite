class MovieFacade
  def self.create_top_rated
    json = MovieService.get_top_rated
    json.map { |data| MovieResult.new(data) }
  end

  def self.create_by_keyword(keywords)
    json = MovieService.get_by_keyword(keywords)
    json.map { |data| MovieResult.new(data) }
  end

  def self.create_movie_details(id)
    json = MovieService.get_details(id)
    MovieDetails.new(json)
  end
end
