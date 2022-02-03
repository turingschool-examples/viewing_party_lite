class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @keyword = params[:keyword]
    @query = CGI.escape "#{@keyword}"
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params[:api_key] = ENV['movies_api_key']
      end
    # response = conn.get("/3/search/movie?api_key=#{conn.params[:api_key]}&query=#{@query}")
    response = conn.get("/3/search/movie?&query=#{@query}")
    @movie = JSON.parse(response.body, symbolize_names: true)

  end

  def show
    @user = User.find(params[:user_id])
    @movie_id = params[:id]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params[:api_key] = ENV['movies_api_key']
      end
    # response = conn.get("/3/search/movie?api_key=#{conn.params[:api_key]}&query=#{@query}")
    movie_id_response = conn.get("/3/movie/#{@movie_id}")
    @movie = JSON.parse(movie_id_response.body, symbolize_names: true)

    cast_response = conn.get("/3/movie/#{@movie_id}/credits")
    @cast = JSON.parse(cast_response.body, symbolize_names: true)
    cast_names = @cast[:cast].map do |person|
      [person[:name], person[:character]]
    end
    @top_10_cast = cast_names[0..10]
  end
end
