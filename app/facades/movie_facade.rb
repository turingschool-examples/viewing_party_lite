class MovieFacade
  class << self 
    def get_a_movie(movie)
      data = MovieService.call_for_a_movie(movie)
      data[:results].map do |movie|
        Movie.new(movie)
      end

    end
  end
end