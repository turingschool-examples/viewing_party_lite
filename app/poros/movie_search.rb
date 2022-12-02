require './app/services/tmdb_services'
require './app/poros/movie'
require './app/poros/character'
require './app/poros/review'

class MovieSearch

  def top_rated_movie_list
    movies = service.top_rated
    movies = movies[:results].first(20)
    movies.map { |movie_hash| Movie.new(movie_hash) }
  end

  def search_movies(query)
    movies = service.search_movies(query)
    movies = movies[:results].first(20)
    movies.map { |movie_hash| Movie.new(movie_hash) }
  end

  def retrieve_movie(movie_id)
    movie = service.get_movie(movie_id)
    Movie.new(movie)
  end

  def retrieve_movie_by_name(movie_name)
    search_response = service.search_movies(movie_name)
    movies = search_response[:results]
    movie_hash = movies.find { |hash| hash[:title] == movie_name}
    Movie.new(movie_hash)
  end
  
  def get_credits(movie_id)
    movie = service.get_credits(movie_id)
    cast = movie[:cast].first(10)
    cast.map do |actor_data|
      Character.new(actor_data)
    end
  end

  def get_reviews(movie_id)
    reviews = service.get_reviews(movie_id)
    usable_reviews = reviews[:results].filter { |review| review[:author_details][:name] != "" }
    usable_reviews.map { |review_hash| Review.new(review_hash) }
  end

  def service
    TmdbService.new
  end
end
