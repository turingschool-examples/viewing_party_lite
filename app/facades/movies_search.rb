class MoviesSearch
  def top_rated_movies
    service.top_rated_movies[:results].map do |data|
      Movie.new(data)
    end
  end

  def service
    MovieService.new
  end

  def movies_keyword(params)
    service.movies_keyword(params)[:results].map do |data|
      Movie.new(data)
    end
  end
end
