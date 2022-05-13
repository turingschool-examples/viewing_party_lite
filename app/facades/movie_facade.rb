class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search(keywords)
    json = MovieService.search(keywords)

    json[:results][0..39].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(movie_id)
    json = MovieService.movie_details(movie_id)
    
    Movie.new(json)
  end
end
