class MoviesController < ApplicationController 
    def index
        @user = User.find(params[:id])
    end 
 
    def search
        # conn = Faraday.new(url: "https://www.themoviedb.org/") do |faraday|
        #     faraday.params["api_key"] = ENV['moviedb_api_key']
        # end
        # response = conn.get("/3/search/movie")

        # json = JSON.parse(response.body, symbolize_names: true)

        movies = json[:results][0][:movies]

        found_movies = movies.find_all {|m| m[:original_title] == params[:search]}
        @movie = found_movies.first
        render "movies/index"
    end
end 