class MovieFacade
  def self.posters(movie)
    json = MovieService.posters_en_us(movie)
    Poster.new(json)
  end

  def self.top_rated
    json = MovieService.top_rated_movies
    
    top_rated_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.searched_movies(keyword)
    json = MovieService.search(keyword)

    searched_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end