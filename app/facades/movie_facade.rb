class MovieFacade
  def movies
    service.get_movies[:results].map do |data|
      Movie.new(data)
    end
  end

  def service
    MovieService.new
  end
end