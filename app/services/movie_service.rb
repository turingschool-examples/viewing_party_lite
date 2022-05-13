class MovieService
  def top_rated
    get_url("/3/movie/top_rated?api_key=#{ENV['api_key']}")
  end

  def search(title)
    get_url("/3/search/movie?api_key=#{ENV['api_key']}&language=en-US&query=#{title}&page=1&include_adult=false")
  end

  def search_by_id(id)
    get_url("/3/movie/#{id}?api_key=#{ENV['api_key']}")
  end

  def get_url(url)
    response = Faraday.new("https://api.themoviedb.org")
    response = response.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
end
