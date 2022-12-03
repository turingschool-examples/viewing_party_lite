  class MovieFacade
    def self.create_top_movies  
      movies = MovieService.get_top_rated
      movies[0..39].map do |movie|
        Movie.new(movie)
      end
    end
    
    def self.movie_search(search_param) 
      movies = MovieService.get_movie_search(search_param)
      movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

    def self.create_spec_movie(id)
      response = MovieService.get_spec_movie(id)
      Movie.new(response)
    end

    def self.create_cast(id)
      response = MovieService.get_cast(id)[:cast].map do |member|
        name = member[:name]
        character = member[:character]
        "#{name} - #{character}"
      end
      # Movie.new(response)
    end

    def self.create_reviews(id)
      # binding.pry
      response = MovieService.get_reviews(id)[:results].map do |review|
        author= review[:author]
        content = review[:content]
        "#{author} - #{content}"
      end
    end

    # def self.create_poster(id)
    #   response = MovieService.get_poster(id)
    #   Movie.new(response)
    # end
end
