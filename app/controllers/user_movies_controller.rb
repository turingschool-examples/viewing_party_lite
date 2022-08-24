class UserMoviesController < ApplicationController

    def search 
        @user = User.find(params[:id])

        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end
        
        if params[:movies] != nil  
            response1 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
            response2 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=2")
        else 
            response1 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{params[:search]}&page=1")
            response2 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{params[:search]}&page=2")
        end 
        
        data1 = JSON.parse(response1.body, symbolize_names: true)
        data2 = JSON.parse(response2.body, symbolize_names: true)

        @movies = data1[:results].concat(data2[:results])
       
        render 'user_movies/search'
    end

    
end 