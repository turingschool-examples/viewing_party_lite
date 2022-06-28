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

  def self.movie_id(movie_id)
    data = MovieService.find_by_id(movie_id)
    movie = Movie.new(data)
  end 

  def self.multiple_movies(movie_ids)
    movies = []
    data = MovieService.find_movies(movie_ids)
    data.each do |movie|
      movies << Movie.new(movie)
    end 
    movies
  end 

  def self.cast(movie_id)
      conn = Faraday.new(url: "https://api.themoviedb.org")
      response2 = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_db_key']}")
      data2 = JSON.parse(response2.body, symbolize_names: true)
      cast = Cast.new(data2)
  end 
  
end 