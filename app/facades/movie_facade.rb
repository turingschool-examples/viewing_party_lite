class MovieFacade
  def self.top_rated
    top_rated = service.top_rated_movies
    top_movies = []
    top_rated.each do |movie|
      top_movies << movie[:original_title]
    end
    top_movies
  end

  def self.service
    MovieService.new
  end
end

# movie_title = "Jurassic Park"
# movie_id = "whatever integer the id is"
# movie_rating = "7.9"