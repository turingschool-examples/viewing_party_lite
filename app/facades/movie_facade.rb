class MovieFacade 
    def top_movies
        top_movies_data.map do |data|
            Movie.new(data)
        end
    end
    

    def top_movies_data
        # @_top_movies_data ||= 
        service.get_top_movies[:results][0..19]
    end

    #reusable base code
    def service 
        # @_service ||= 
        MovieService.new
    end
end