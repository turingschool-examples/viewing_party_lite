require_relative '../services/movie_service'
require_relative '../poros/min_movie'

class MovieFacade

  def self.movie_card(movie_id)
    MinMovie.new(MovieService.movie_details(movie_id))
  end

  def self.top_rated(page = 1)
    movies = []
    MovieService.top_rated(page)[:results]
                .each { |result| movies << MinMovie.new(result) }
    movies
  end

  def self.search(query, page = 1)
    movies = []
    MovieService.search(query, page)[:results]
                .each { |result| movies << MinMovie.new(result) }
    movies
  end


  def self.new_movie_details(movie_id)
    movie_details = MovieService.movie_details(movie_id)
    movie_reviews = MovieService.movie_reviews(movie_id)
    movie_credits = MovieService.movie_credits(movie_id)
    Movie.new(movie_details, movie_reviews, movie_credits)
  end

  # def self.vote_average(movie_id)
  #   MovieService.movie_details(movie_id)[:vote_average]
  # end

  # def self.runtime(movie_id)
  #   MovieService.movie_details(movie_id)[:runtime]
  # end

  # def self.genres(movie_id)
  #   MovieService.movie_details(movie_id)[:genres].map do |key|
  #     key[:name]
  #   end
  # end

  # def self.summary_description(movie_id)
  #   MovieService.movie_details(movie_id)[:overview]
  # end

  # def self.first_10_cast_members(movie_id)
  #   MovieService.movie_credits(movie_id)[:cast].sort_by{ |actor| actor[:order].to_i }.map do |actor|
  #     [actor[:name], actor[:character]]
  #   end.first(10)
  # end

  # def self.total_reviews(movie_id)
  #   MovieService.movie_reviews(movie_id)[:total_results]
  # end

  # def self.review_info(movie_id)
  #   MovieService.movie_reviews(movie_id)[:results]
  # end

end

