class MovieFacade 

  def self.movies(movie_ids)
    movie_ids.map {|id| movie_detail(id)}
  end

  def self.movie_detail(movie_id)
    Movie.new(MovieService.details(movie_id))
  end

  def self.get_top_rated 
    json = MovieService.top_rated
    json[:results].map do |movie_data| 
      MovieResult.new(movie_data)
    end
  end

  def self.search(search_term)
    json = MovieService.search(search_term)
    json[:results].map do |movie_data| 
      MovieResult.new(movie_data)
    end
  end
end