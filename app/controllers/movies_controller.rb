class MoviesController < ApplicationController
  def index
    if params[:q] == 'top rated'
      conn = Faraday.new(url: "https://api.themoviedb.org", params: {api_key: ENV['api_key']})
    
      response = conn.get("/3/movie/top_rated")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    else
      keyword = params[:q]
      conn = Faraday.new(url: "https://api.themoviedb.org", params: {api_key: ENV['api_key']})
      
      response = conn.get("/3/search/movie", { query: keyword, include_adult: false } )
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    end
  end

  private

  # def movie_params
  #   params
  # end
end