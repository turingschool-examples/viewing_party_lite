class MovieController < ApplicationController
    
    def top_rated
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["Authorization"] = Bearer ENV['tmdb_api_key']
        end

        response = conn.get("/3/movie/top_rated?")
        data = JSON.parse(response.body, symbolize_names: true)

        @movies = data[:results]
        render 'movies/results'
    end
end