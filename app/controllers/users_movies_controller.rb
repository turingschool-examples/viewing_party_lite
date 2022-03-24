class UsersMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
      faraday.params['query'] = params[:search]
    end

    if params[:top_rated] == "top_rated"
      top_rated_response = conn.get("movie/top_rated")
      data = JSON.parse(top_rated_response.body, symbolize_names: true)

      @movies = data[:results].map do |result|
          Movies.new(result)
      end.take(20)

    elsif params[:search]
      response = conn.get("search/movie")
      data = JSON.parse(response.body, symbolize_names: true)

      @movies = data[:results].map do |result|
        Movies.new(result)
      end.take(40)
    end
  end

  def show
  end
end
