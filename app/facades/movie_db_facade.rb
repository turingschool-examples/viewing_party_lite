class MovieDbFacade
  def self.top_20_movies
    json = MovieDbService.top_rated_movies
    json[:results].map { |film_data|{:id => film_data[:id],
                                  :title => film_data[:title],
                                  :vote_average => film_data[:vote_average] }}
  end

  def self.search_movies(keyword)
    json = MovieDbService.movies_search(keyword)
    json[:results].map { |film_data|{:id => film_data[:id],
                                  :title => film_data[:title],
                                  :vote_average => film_data[:vote_average] }}
  end

  def self.find_by_movie_id(id) #creates movie object
    json = MovieDbService.find_movie_by_id(id)
    Movie.new(json)
  end 

  def self.reviews_by_movie(movie_id) #creates review objects in an array
    json = MovieDbService.find_movie_reviews(movie_id)
    json[:results].map { |review_data| Review.new(review_data) }
  end

  def self.cast(movie_id)
    json = MovieDbService.cast(movie_id)
    json[:cast].first(10).map { |cast_data| CastMember.new(cast_data) }
  end
  
end
