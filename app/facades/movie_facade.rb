class MovieFacade

  def self.top_rated
    movies = []
    data = MovieService.top_rated_endpoint
    data.each do |movie|
      movies << Movie.new(movie)
    end 
    movies
  end

  def self.search_for_movies(keyword)
    results = [] 
    data = MovieService.search_for_movies(keyword)
    data.each do |movie|
      results << Movie.new(movie)
    end 
    results
  end 
  

end 