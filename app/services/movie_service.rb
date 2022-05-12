class MovieService < BaseService
  def self.get_top_rated
    # response = conn("http://api.themoviedb.org").get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    response = conn.get('/3/movie/top_rated?')
    get_json(response)
  end

  def self.movie_details(id)
    # response = conn("http://api.themoviedb.org").get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}&append_to_response=credits,reviews")
    response = conn.get("/3/movie/#{id}?")
    get_json(response)
  end

  def self.conn
    Faraday.new("http://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end



end
