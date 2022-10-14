class MovieFacade

  def self.movie_details(search_id)
    data = MovieService.movie_by_id(search_id)
    Movie.new(data)
  end

  def self.top_20_movies
    data = MovieService.top_rated_movies
    data[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def self.search_results(movie_term)
    data = MovieService.movie_search(movie_term)
    data[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def self.lead_roles(movie_id)
    data = MovieService.movie_cast(movie_id)
    data[:cast].map do |thespian|
      Cast.new(thespian)
    end[0..9]
  end

  def self.movie_critics(movie_id)
    data = MovieService.movie_reviews(movie_id)
    data[:results].map do |critic|
      Review.new(critic)
    end
  end

end
