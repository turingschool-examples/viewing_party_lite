class MovieFacade

  def top20(data = top_movies_data)
  	data.map do |movie_data|
  	  TopMovie.new(movie_data)
  	end
  end

  def top_movies_data
  	@_top_movies_data ||= service.get_top20
  end

  def service
  	@_service ||= TmdbService.new
  end
end