# frozen_string_literal: true

class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @movies = if params[:q].present?
                MovieFacade.movie_search(params[:q])
              else
                MovieFacade.top_rated
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
