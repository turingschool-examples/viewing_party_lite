class MoviesFacade
  def self.top_rated_movies
    json = MoviesService.top_rated

    @movies = json[:results].map do |movie_data|
      MovieDetailed.new(movie_data)
    end
  end

  def self.searched_movies(title)
    json = MoviesService.search_by_title(title)

    @movies = json[:results].map do |movie_data|
      MovieDetailed.new(movie_data)
    end
  end

  def self.movie_details(id)
    details = MoviesService.movie_details(id)
    reviews = MoviesService.movie_reviews(id)
    credits = MoviesService.movie_credits(id)


    response = details.merge(credits, reviews)


    @movie = MovieDetailed.new(response)
  end
end