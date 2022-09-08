class MovieFacade

  def self.top_rated
    data = MovieService.top_rated
    data.map do |movie|
      Movie.new(movie)
    end 
    
  end

  def self.movie_search(keyword)
    data = MovieService.search_for_movies(keyword)
    unless data.nil?
      data.map do |movie|
        Movie.new(movie)
      end
    end 
  end 

  def self.movie_id(movie_id)
    data = MovieService.find_by_id(movie_id)
    movie = Movie.new(data)
  end 

  def self.multiple_movies(movie_ids)
    data = MovieService.find_movies(movie_ids)
    data.map do |movie|
      Movie.new(movie)
    end 

  end 

  def self.first_10_cast(movie_id)
    data = MovieService.find_cast(movie_id)
    data.first(10)
  end 
  
end 