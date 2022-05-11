class MovieService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers["api_key"] = ENV["movie_api_key"]
      f.adapter Faraday.default_adapter
    end
  end

  def self.top_20
    response = conn.get("/3/movie/top_rated") do |c|
      c.options.params_encoder = Faraday::FlatParamsEncoder
      c.params = {api_key: ENV["movie_api_key"]}
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword, page_num)
    response = conn.get("/3/search/movie") do |c|
      c.options.params_encoder = Faraday::FlatParamsEncoder
      c.params = {
        api_key: ENV["movie_api_key"],
        query: keyword,
        page: page_num
      }
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(id)
    response = conn.get("/3/movie/#{id}") do |c|
      c.options.params_encoder = Faraday::FlatParamsEncoder
      c.params = {
        api_key: ENV["movie_api_key"]
      }
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_members(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits") do |c|
      c.options.params_encoder = Faraday::FlatParamsEncoder
      c.params = {
        api_key: ENV["movie_api_key"]
      }
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
