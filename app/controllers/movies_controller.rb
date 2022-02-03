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

  end
end
