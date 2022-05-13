class MovieFacade
  def self.create_movies
    json = MovieService.movie_titles_by_rating

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
