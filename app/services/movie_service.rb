class MovieService
  def self.find_top_movies
    url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movies(keyword)
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&query=#{keyword}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_details(id)
    url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['api_key']}&append_to_response=runtime"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cast(id)
    url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV['api_key']}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_reviews(id)
    url = "https://api.themoviedb.org/3/movie/#{id}/reviews?api_key=#{ENV['api_key']}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
