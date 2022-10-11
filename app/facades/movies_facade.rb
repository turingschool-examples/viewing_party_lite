class MoviesFacade
  def self.top_rated
    response = MoviesService.top_rated

    response[:results].map do |movie|
      Movie.new(movie)
    end
  end
end