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

  private

  # def movie_params
  #   params
  # end
end