class MovieService 
    def self.get_top_movies 
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['movie_api_key']
        end
        page_1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
        page_2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")
        page_1_data = JSON.parse(page_1.body, symbolize_names: true)
        page_2_data = JSON.parse(page_2.body, symbolize_names: true)


        response = page_1_data[:results] + page_2_data[:results]
    end

    def self.get_movie(id)
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['movie_api_key']
        end
        movie_details = conn.get("/3/movie/#{id}")
        credits = conn.get("/3/movie/#{id}/credits")

        data_1 = JSON.parse(movie_details.body, symbolize_names: true)
        data_2 = JSON.parse(credits.body, symbolize_names: true)

        response = data_1 + data_2

    end
end