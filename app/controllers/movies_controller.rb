class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org", params: {api_key: ENV['api_key']})
    if params[:q] == 'top rated'
      response = conn.get("/3/movie/top_rated")
    else
      response = conn.get("/3/search/movie", { query: params[:q], include_adult: false } )
    end
    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results]
  end

  def show
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org", params: {api_key: ENV['api_key']})
    mov_response = conn.get("/3/movie/#{params[:id]}")
    @movie = JSON.parse(mov_response.body, symbolize_names: true)
 
    credits_response = conn.get("/3/movie/#{params[:id]}/credits")
    credits_data = JSON.parse(credits_response.body, symbolize_names: true)
    @cast = credits_data[:cast]

    rev_response = conn.get("/3/movie/#{params[:id]}/reviews")
    rev_data = JSON.parse(rev_response.body, symbolize_names: true)
    @reviews = rev_data[:results]
    # require 'pry'; binding.pry
  end

  private

  # def movie_params
  #   params
  # end
end