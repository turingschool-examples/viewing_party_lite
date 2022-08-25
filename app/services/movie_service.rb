class MovieService 

    def self.conn 
        Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end
    end 

    def self.movie_data(movie_id)
        response1 = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
        json = JSON.parse(response1.body, symbolize_names: true)
    end 

    def self.cast_data(movie_id) 
        cast_response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")
        json = JSON.parse(cast_response.body, symbolize_names: true)
    end 

    def self.review_data(movie_id) 
        review_response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}&language=en-US")
        json = JSON.parse(review_response.body, symbolize_names: true)
    end 

    def self.movie_search(search_string)
        search1 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{search_string}&page=1")
        search2 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{search_string}&page=2")
        data1 = JSON.parse(search1.body, symbolize_names: true)
        data2 = JSON.parse(search2.body, symbolize_names: true)
        json = data1[:results].concat(data2[:results])
    end 

    def self.top_movies
        top1 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
        top2 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=2")
        data1 = JSON.parse(top1.body, symbolize_names: true)
        data2 = JSON.parse(top2.body, symbolize_names: true)
        json = data1[:results].concat(data2[:results])
    end 

end 