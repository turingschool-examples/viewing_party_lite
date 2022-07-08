class MovieFacade
  def self.top_40
    json = MovieService.top_movies
    json.map do |page_hash|
      page_hash[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end.flatten
  end
end
