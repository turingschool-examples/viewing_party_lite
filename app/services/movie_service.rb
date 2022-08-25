class MovieService

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search1
    response = conn.get("/3/search/movie?page=1&query={#{@query}}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search2
    response2 = conn.get("/3/search/movie?page=2&query={#{@query}}")
    data2 = JSON.parse(response2.body, symbolize_names: true)
  end


  private
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['api_key']
    end
  end
end
