  class MoviesFacade
    def self.get_top_rated_movies
      json = MoviesService.top_rated_movies

      json[:results].map do |movie|
        Movie.new(movie)
      end
    end

    def self.get_movies_by_keyword(keyword)
      json = MoviesService.get_movies_keyword(keyword)
        json.map do |page|
          page[:results].map do |movie|
            Movie.new(movie)
        end
      end.flatten
    end
  end
