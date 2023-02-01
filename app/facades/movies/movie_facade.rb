module Movies
  class MovieFacade
    attr_reader :movie_service

    def initialize
    end

    def get_title(id)
      movie = MovieService.new
      title = MovieService.get_movie(id)
      movie_title = title[:title]
    end
  end
end