class MovieService < BaseService
  def self.get_top_rated
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['api_key']}")
    data = get_json(response)
    data[:results]
  end

  def self.get_by_keyword(keywords)
    response = conn.get("/3/search/movie?api_key=#{ENV['api_key']}&query=#{keywords}")
    data = get_json(response)
    data[:results]
  end

  def self.get_details(id)
    response = conn.get("/3/movie/#{id}?api_key=#{ENV['api_key']}")
    get_json(response)
  end

  def self.get_cast(id)
    response = conn.get("/3/movie/238/credits?api_key=#{ENV['api_key']}")
    data = get_json(response)
    data[:cast]
  end
end
