class MovieService


  def top_40_rated_movies

    response_1 = conn.get("/3/movie/top_rated?page=1")
    response_2 = conn.get("/3/movie/top_rated?page=2")

    data_1 = JSON.parse(response_1.body, symbolize_names: true)
    data_2 = JSON.parse(response_2.body, symbolize_names: true)
    combo_data = data_1[:results] + data_2[:results]
  end

  def movie_search(query)
    response = conn.get("/3/search/movie?&language=en-US&query=#{query}&page=1")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def poro_search(id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{id}?&language=en-US")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def details_of_movie(id)
    response = conn.get("/3/movie/#{id}?append_to_response=credits,reviews")

    data = JSON.parse(response.body, symbolize_names: true)
  end
  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do | faraday |
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end
end

#endpoint /movie/{movie_id}
 #genres
 #Title
 #runtime
 #overview (might be summary)

 #endpoint /movies/{movie_id}/reviews
 #count of total reviews
 #each review author and Info

 #endpoint /movies/{movie_id}/credits
 #Top 10 actors
