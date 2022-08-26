class MovieFacade
  def service
      MovieService.new
  end

  def self.top_movies
    MovieService.top_movies[:results].map do |data|
      Movie.new(data)
    end
  end

  def self.search_movies(movie)
      json = MovieService.search_movies_by_title(movie)
      @movies =json[:results].map do |movie_data|
          Movie.new(movie_data)
      end
  end
end 
