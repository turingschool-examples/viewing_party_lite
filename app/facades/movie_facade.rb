class MovieFacade
  def self.create_top_rated
    json = MovieService.top_rated
    json.map { |data| Movie.new(data) }
  end

  def self.create_searched(query)
    json = MovieService.search(query)
    json.map { |data| Movie.new(data) }
  end
end
