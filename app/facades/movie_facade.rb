class MovieFacade
  class << self
    def top_rated_movies
      response = MovieService.top_rated_movies

      response[:results].map do |data|
        Movie.new(data)
      end
    end
  end
end
