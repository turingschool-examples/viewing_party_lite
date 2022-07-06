class MoviesController < ApplicationController 
    def search
        connection = Faraday.new(url: "https://api.themoviedb.org/3") do |f|
            f.headers['api_key'] = ENV[ 'tmdb_api_key' ]
        end
    end
end