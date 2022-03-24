class MoviesController < ApplicationController

  # def index
  #   movie = params[:movie]
  #
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.params['api_key'] = ENV['tmdb_key']
  #   end
  #
  #   response = conn.get("/3/search/movie?api_key=#{ENV['tmdb_key']}&query=#{movie}&page=1")
  #
  #   data = JSON.parse(response.body, symbolize_names: true)
  # end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_show(params[:id])
  end
end
