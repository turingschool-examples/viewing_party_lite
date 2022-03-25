class MovieFacade
  def self.get_movie(api_id)
    MovieService.get_movie(api_id)
  end

  def self.get_10_cast(api_id)
    MovieService.get_cast(api_id)[0..9]
  end

  def self.get_reviews(api_id)
    MovieService.get_reviews(api_id)
  end
end
