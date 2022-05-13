class UserMoviesController < ApplicationController

  def index
    @user = User.find(params[:id])
    
    if params[:top_rated]
      conn = Faraday.new(url: "https://api.themoviedb.org") 
      response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = []
      data[:results].each do |movie|
        @movies << Movie.new(movie)
      end 
      @movies

    elsif params[:keyword]
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params[:query] = params[:keyword]
      end 
      response = conn.get("/3/search/movie?api_key=#{ENV['movie_db_key']}")
      data = JSON.parse(response.body, symbolize_names: true)
      @results = data[:results]
      @keyword = params[:keyword]
    end 
  end

  def show
    @user = User.find(params[:user_id])
    # @movie = api call for movie?

    conn = Faraday.new(url: "https://api.themoviedb.org")
    response1 = conn.get("/3/movie/#{params[:movie_id]}?api_key=#{ENV['movie_db_key']}")
    response2 = conn.get("/3/movie/#{params[:movie_id]}/credits?api_key=#{ENV['movie_db_key']}")
    data1 = JSON.parse(response1.body, symbolize_names: true)
    data2 = JSON.parse(response2.body, symbolize_names: true)

    @movie_data = {movie: data1, cast: data2[:cast][0..9]}
  end
  
  


end 