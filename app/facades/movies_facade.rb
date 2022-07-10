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

    def self.get_cast(movie_id)
      json = MoviesService.get_movie_cast(movie_id)
      json[:cast].map do |actor|
        Actor.new(actor)
      end
    end

    def self.get_details(movie_id)
      json = MoviesService.get_movie_details(movie_id)
      MovieDetails.new(json)
    end

    def self.get_reviews(movie_id)
      json = MoviesService.get_movie_reviews(movie_id)
      json[:results].map do |author|
        MovieReview.new(author)
      end
    end
    
    def self.get_poster(movie_id)
      Movie.new(MoviesService.get_movie_details(movie_id))
    end
  end
