# frozen_string_literal: true

class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])

    if params[:q].present?
      # @movies = Movie.search(params[:q])
    else
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['tmdb_api_key']
      end

      response_1 = conn.get('/3/movie/top_rated')
      response_2 = conn.get('/3/movie/top_rated?page=2')

      json_1 = JSON.parse(response_1.body, symbolize_names: true)
      json_2 = JSON.parse(response_2.body, symbolize_names: true)

      top_40 = json_1[:results] + json_2[:results]

      @movies = top_40.map do |movie_data|
        Movie.new(movie_data)
      end
    end
  end

  # def show
  #   movie_id = params[:movie_id]

  #   conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
  #     faraday.headers['api_key'] = ENV['tmdb_api_key']
  #   end

  #   response = conn.get("/3/movie/#{movie_id}")

  #   json = JSON.parse(response.body, symbolize_names: true)

  #   # @movie = Movie.new(data)
  # end
end
