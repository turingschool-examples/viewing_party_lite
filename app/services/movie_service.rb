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
    get_url('/3/movie/top_rated')[:results]
  end 

  def self.search_for_movies(keyword)
    get_url("/3/search/movie", keyword)[:results]
  end 

  def self.find_by_id(movie_id)
    get_url("/3/movie/#{movie_id}")#[:results]
  end 

  def self.find_cast(movie_id)
   # binding.pry
      get_url("/3/movie/#{movie_id}/credits")[:cast]
  end 

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