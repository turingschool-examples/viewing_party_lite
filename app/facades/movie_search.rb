class MovieSearch 
  def service 
    MovieService.new
  end

  def search(movie)
    service.search_for_movie(movie).map do |data|
      Movies.new(data)
    end
  end
end