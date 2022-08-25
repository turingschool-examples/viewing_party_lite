class MovieFacade

  def self.top_20_rated
    parsed_json = MovieService.top_rated
    parsed_json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  # def self.search
  #   parsed_json1 = MovieService.search1
  #   parsed_json2 = MovieService.search2
  #   @movies1 = parsed_json1[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  #   @movies2 = parsed_json2[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end
end
