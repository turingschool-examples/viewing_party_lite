class MovieDbService
  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated_1
    get_url('https://api.themoviedb.org/3/movie/top_rated?api_key=695b2e6d744863a3cea31aa226dba750')
  end

  def top_rated_2
    get_url('https://api.themoviedb.org/3/movie/top_rated?api_key=695b2e6d744863a3cea31aa226dba750&page=2')
  end

  def search_by_title(keyword)
    get_url("https://api.themoviedb.org/3/search/movie?api_key=695b2e6d744863a3cea31aa226dba750&query=#{keyword}")
  end
end
