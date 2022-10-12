class MovieFacade
  def self.top_rated
    MovieService.top_forty.map do |info|
      Movie.new(info)
    end
  end

  def self.search(keyword_string)
    MovieService.movie_search(keyword_string).map do |info|
      Movie.new(info)
    end
  end

  def self.details(movie_id)
    MovieDetails.new(MovieService.movie_details(movie_id))
  end
end