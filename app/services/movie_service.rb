require 'faraday'
class MovieService

  def search_movies(params)
    url = "https://api.themoviedb.org/3/search/movie?api_key=5b03ee47af6e087159e9baca0f110161&query=" + params
    response = Faraday.get(url)

    data = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def top_rated_movies
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=5b03ee47af6e087159e9baca0f110161")

    data = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def movie_details(id)

  end
end

