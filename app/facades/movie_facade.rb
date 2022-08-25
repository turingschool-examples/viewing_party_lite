class MovieFacade 

  def self.movies(movie_ids)
    movie_ids.map {|id| helper(id)}
  end

  def self.helper(movie_id)
    Movie.new(MovieService.details(movie_id))
  end

  def self.get_top_rated 
    json = MovieService.top_rated
    json[:results].map do |movie_data| 
      TopMovie.new(movie_data)
    end
  end
end