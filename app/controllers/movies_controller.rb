class MoviesController < ApplicationController
  def index
    # if params[:q] == "top%20rated"
    #   @movies = @top_rated
    # else
    #   params[:q] # value of 'q' is used to filter API search
    #   # @movies = @filter_search_results(params[:q]) <-- value of 'q' passed as variable
    # end
  end

  def search
    @user = User.find(params[:user_id])
    # conn = Faraday.new(
    #   url: 'https://api.themoviedb.org/3/movie/',
    #   params: {api_key: ENV['moviebd_api_key']}
    #   )

    # top_rated = conn.get('/top_rated')
  end
end
