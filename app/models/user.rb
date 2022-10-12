class User < ApplicationRecord
    has_many :viewing_party_users
    has_many :viewing_parties, through: :viewing_party_users

    def top_20_movies
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
          end
          response = conn.get("3/movie/top_rated")
      
          data = JSON.parse(response.body, symbolize_names: true)
      
          movies = data[:results]
    end

    def search_movies(keyword)
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
            faraday.params["query"] = keyword
          end
          response = conn.get("3/search/movie")
      
          data = JSON.parse(response.body, symbolize_names: true)
      
          movies = data[:results]
    end
end