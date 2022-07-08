class MovieFacade
  def self.create_top_rated
    json = MovieService.get_top_rated
    json.map { |data| TopRated.new(data) }
  end
end
