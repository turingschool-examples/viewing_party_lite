class UserMoviesController < ApplicationController

  def index
    @query = params[:query]
    @user = User.find(params[:id])
    conn = Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    response_page_one = conn.get("/3/movie/top_rated?api_key=6bb70d8448dabf0d4dbdfa9e215e1826")
    response_page_two = conn.get("/3/movie/top_rated?page=2&api_key=6bb70d8448dabf0d4dbdfa9e215e1826")
    data_page_one = JSON.parse(response_page_one.body, symbolize_names: true)
    data_page_two = JSON.parse(response_page_two.body, symbolize_names: true)
    a = data_page_one[:results]
    b = data_page_two[:results]
    @top_movies = (a << b).flatten

  end

  def search
      @user = User.find(params[:id])
      conn = Faraday.new("https://api.themoviedb.org") do |faraday|
        faraday.params['api_key'] = ENV['movie_api_key']
      end
      response = conn.get("/3/search/movie?query=#{params[:search]}&api_key=#{ENV['movie_api_key']}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
      @search = params[:search]
      render :index
    end

  end
