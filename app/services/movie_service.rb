class MovieService 

    def get_top_movies 
        get_url("3/movie/top_rated?api_key=f57beefd0f3cef1f6183a305da5f8630")
    end

    def get_search_results(query) 
        get_url("3/search/movie?api_key=f57beefd0f3cef1f6183a305da5f8630&query=#{query}")
    end

    #resuable base code
    def get_url(uri) 
        response = Faraday.get("https://api.themoviedb.org/#{uri}")
        JSON.parse(response.body, symbolize_names: true)
    end
end