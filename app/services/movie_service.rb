class MovieService < ApplicationService

  def top_movies
    page1 = conn.get("/3/movie/popular")
    page2 = conn.get("/3/movie/popular?page=2")
    parse_json(page1.body)[:results] + parse_json(page2.body)[:results]
  end

  def movies_by_query(search)
    page1 = conn.get("/3/search/movie?query=#{search}")
    page2 = conn.get("/3/search/movie?query=#{search}&page=2")
    parse_json(page1.body)[:results] + parse_json(page2.body)[:results]
  end

  def movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response.body)
  end

  def cast(movie_id)
    conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}")[:cast]
  end

  def reviews(movie_id)
    conn.get("/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}")[:results]
  end
end
