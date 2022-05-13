class MovieFacade
  def self.create_top_rated_movies
    json = MovieService.movie_titles_by_rating

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
