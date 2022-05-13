class MovieFacade
  def self.create_top_rated_movies
    json = MovieService.movie_titles_by_rating

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.create_search_movies(query)
    json = MovieService.movie_by_keyword(query)

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
