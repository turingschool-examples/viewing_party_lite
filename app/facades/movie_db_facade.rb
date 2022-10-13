
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



  def self.find_by_movie_id(id)
    json = MovieDbService.find_movie_by_id(id)
    Movie.new(json)
  end

  def self.reviews_by_movie(movie_id)
    json = MovieDbService.find_movie_reviews(movie_id)
    json[:results].map { |review_data| Review.new(review_data) }
  end

end
