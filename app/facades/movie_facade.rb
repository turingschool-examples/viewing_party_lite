class MovieFacade
  def self.search(title)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
      faraday.params["query"] = title
    end
    response = conn.get("/3/search/movie")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results][0..19]
    # require "pry"; binding.pry
  end

  def self.top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
    response = conn.get("/3/movie/top_rated")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results][0..19]


    # require "pry"; binding.pry
  end
end
