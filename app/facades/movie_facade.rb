class MovieFacade
  def self.top_rated_array
    parsed_json = MovieService.find_top_rated

    parsed_json[:results].map do |movie_json|
      Movie.new(movie_json)
    end
  end
end