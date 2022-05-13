# frozen_string_literal: true

class MovieService < ApplicationService
  def top_movies
    page1 = conn.get('/3/movie/popular')
    page2 = conn.get('/3/movie/popular?page=2')
    parse_json(page1)[:results] + parse_json(page2)[:results]
  end

  def movies_by_query(search)
    page1 = conn.get("/3/search/movie?query=#{search}")
    page2 = conn.get("/3/search/movie?query=#{search}&page=2")
    parse_json(page1)[:results] + parse_json(page2)[:results]
  end

  def movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response)
  end

  def cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)[:cast]
  end

  def reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)[:results]
  end
end
