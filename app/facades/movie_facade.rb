class MovieFacade
  def self.get_movie(api_id)
    MovieService.get_movie(api_id)
  end

  def self.top_twenty
    MovieService.top_rated
  end
end
