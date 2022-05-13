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
  
  def search_by_id(id)
    Movie.new(service.search_by_id(id))
  end

  def service
    MovieService.new
  end
end