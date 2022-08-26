class MovieFacade
  def service
      MovieService.new
  end

  def self.top_movies
    MovieService.top_movies[:results].map do |data|
      Movie.new(data)
    end
  end

end
