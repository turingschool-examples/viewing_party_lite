class MovieFacade
  def top_rated
    service.top_rated[:results].map do |data|
      Movie.new(data)
    end
  end

  def search(title)
    service.search(title)[:results].map do |data|
      Movie.new(data)
    end
  end

  def service
    MovieService.new
  end
end