class MoviesFacade
  def self.top_20(query)
    data = MoviesService.movie_search
    results = data[:results].find_all do |movie|
      movie[:title].downcase.include?(query.downcase)
    end
  end
end
