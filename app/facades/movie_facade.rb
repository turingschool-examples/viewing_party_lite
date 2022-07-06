class MovieFacade 
    def self.top_rated_movies 
        connection = Faraday.new(url: 'https://api.themoviedb.org') do |f|
            f.headers['api_key'] = ENV[ 'tmdb_api_key' ]
        end

        response = connection.get("/3/movie/top_rated?api_key=02f6db89ebe8897a06342829374c182c&language=en-US&page=1")
        response2 = connection.get("/3/movie/top_rated?api_key=02f6db89ebe8897a06342829374c182c&language=en-US&page=2")
        json = JSON.parse(response.body, symbolize_names: true)
        json2 = JSON.parse(response2.body, symbolize_names: true)

        top_40 = json[:results] + json2[:results]

        @movies = top_40.map do |movie_data|
            Movie.new(movie_data)
        end
        
    end
end