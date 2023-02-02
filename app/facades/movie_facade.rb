class MovieFacade
  def self.discover(path, params)
    data = MovieService.ping(path, params)

    movies = data[:results].first(20)

    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.details(path, params)
    movie_data = MovieService.ping(path, params)
    cast = CastFacade.get(params[:movie_id])
    reviews = ReviewFacade.get(params[:movie_id])

    Movie.new(movie_data, cast, reviews)
  end
end
