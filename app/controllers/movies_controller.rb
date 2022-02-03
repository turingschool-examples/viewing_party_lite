class MoviesController < ApplicationController
  def index
    @keyword = params[:keyword]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params[:api_key] = ENV['movies_api_key']
      end
    response = conn.get("/3/movie/550")
    @movie = JSON.parse(response.body, symbolize_names: true)

  end

  # def search
  #
  #   @user = User.find(params[:user_id])
  #   require "pry"; binding.pry
  #
  #   conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
  #     faraday.headers["X-API-KEY"] = ENV['movies_api_key']
  #   end
  #   response = conn.get("/movie/550")
  #   data = JSON.parse(response.body, symbolize_names: true)
  #   #
  #   # movies = data[:results][0][:movies]
  #   #
  #   # found_movies = movies.find_all {|m| m[:title] == params[:search]}
  #   # @movie = found_movies
  #   # redirect_to "/users/#{@user.id}/movies"
  # end

end
