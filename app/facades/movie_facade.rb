class MovieFacade

    def initialize(id = 0)
      @id = id
    end

    def top_movies
        top_movies_data.map do |data|
            Movie.new(data)
        end
    end
  
    def top_movies_data
        # @_top_movies_data ||=
        service.get_top_movies[:results][0..19]
    end

    def movie_details
      service.get_movie_by_id(@id)
    end

    def movie_cast_members
      service.get_movie_cast(@id)
    end

    def movie_reviews
      service.get_movie_reviews(@id)
    end

    def search_results(query)
        search_results_data(query).map do |data|
            Movie.new(data)
        end
    end
  
    def search_results_data(query)
        service.get_search_results(query)[:results][0..39]
    end

    #reusable base code
    def service
        # @_service ||=
        MovieService.new
    end
end
