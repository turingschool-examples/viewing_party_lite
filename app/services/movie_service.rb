class MovieService

  def self.get_url(url, keyword = nil)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV['tmdb_api_key']
      f.params[:query] = keyword unless keyword.nil?
    end
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    get_url('3/movie/top_rated')[:results]
  end 

  # def self.search_for_movies(keyword)
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.params[:query] = keyword
  #   end 
  #   response = conn.get("/3/search/movie?api_key=#{ENV['tmdb_api_key']}")
  #   data = JSON.parse(response.body, symbolize_names: true)
  #   data[:results]
  # end 

  # def self.find_by_id(movie_id)
  #   conn = Faraday.new(url: "https://api.themoviedb.org")
  #   response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb_api_key']}")
  #   data = JSON.parse(response.body, symbolize_names: true)
  # end 

  # def self.find_movies(movie_ids)
  #   movies = []
  #   movie_ids.uniq.each do |id|
  #     conn = Faraday.new(url: "https://api.themoviedb.org")
  #     response = conn.get("/3/movie/#{id}?api_key=#{ENV['tmdb_api_key']}")
  #     movies << JSON.parse(response.body, symbolize_names: true)
  #   end 
  #   movies
  # end 
end 