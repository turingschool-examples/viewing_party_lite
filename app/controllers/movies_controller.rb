class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.get_movie_search_facade(params[:search])
    else
      @movies = MovieFacade.get_top_movies
    end

    @user = User.find(params[:user_id])

    # connection = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = ENV['movies_api_key'] #adding headers, storing request and response meta data.. information about the request
    # end

    # response = connection.get("/3/movie/top_rated")

    # data = JSON.parse(response.body, symbolize_names: true)
    # @movies = data[:results]
    # render "movies/index"
  end
end
