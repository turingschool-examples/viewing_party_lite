class MoviesFacade
  def self.top_20(query)
    data = MoviesService.movie_search
    results = data[:results].find_all do |movie|
      movie[:title].downcase.include?(query.downcase)
    end
  end

  def self.top_movies 
    data = MoviesService.top_rated
    data[:results].first(20)
  end
end
