class MovieFacade
  def self.top_rated
    json = MovieService.top_rated

    @top_rated = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_title_search(query)
    json = MovieService.movie_title_search(query)

    @movie_search = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end


end
