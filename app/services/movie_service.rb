class MovieService
  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_movies
    page1 = get_url("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['tmdb_key']}")[:results]
    page2 = get_url("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['tmdb_key']}&page=2")[:results]
    page1 + page2
  end

  def movies_by_query(search)
    page1 = get_url("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&query=#{search}")[:results]
    page2 = get_url("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&query=#{search}&page=2")[:results]
    page1 + page2
  end

  def movie_details(movie_id)
#    binding.pry
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['tmdb_key']}")
    #movie_title
    #vote_average
    #runtime
    #genres [{ id, name }]
    #overview
  end

  def cast(movie_id)
    data = get_url("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}")[:cast]
    #cast [0..10]
  end

  def reviews(movie_id)
    data = get_url("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}")
    #total_results
  end
end
