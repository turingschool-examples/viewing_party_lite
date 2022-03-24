class MovieFacade
  def self.get_movie(api_id)
    MovieService.get_movie(api_id)
  end
end
