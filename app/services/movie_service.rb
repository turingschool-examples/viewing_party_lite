require 'faraday'
class MovieService
  def initialize
    @api_key = "5b03ee47af6e087159e9baca0f110161" 
  end

  def search_movies(params)
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{@api_key}&query=" + params
    response = Faraday.get(url)

    data = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def top_rated_movies
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{@api_key}")

    data = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def movie_details(id)
    movie_url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{@api_key}"
    movie_response = Faraday.get(movie_url)
    cast_url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{@api_key}&language=en-US"
    cast_response = Faraday.get(cast_url)
    reviews_url = "https://api.themoviedb.org/3/movie/#{id}/reviews?api_key=#{@api_key}&language=en-US&page=1"
    reviews_response = Faraday.get(reviews_url)
    movie_data = JSON.parse(movie_response.body, symbolize_names: true)
    cast_data = JSON.parse(cast_response.body, symbolize_names: true)[:cast][0..9]
    reviews_data = JSON.parse(reviews_response.body, symbolize_names: true)
    data = [movie_data, cast_data, reviews_data]
  end
end

