# frozen_string_literal: true

class MoviesController < ApplicationController
  def discover

  end 

  # def index
  #   conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
  #     faraday.headers['api-key'] = ENV['tmdb_api_key']
  #   end

  #   response = conn.get('/3/movie/top_rated')

  #   json = JSON.parse(response.body, symbolize_names: true)

  #   @movies = json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end

  # def show
  # movie_id = params[:movie_id]

  #   conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
  #     faraday.headers['api-key'] = ENV['tmdb_api_key']
  #   end

  #   response = conn.get("/3/movie/#{movie_id}")

  #   json = JSON.parse(response.body, symbolize_names: true)

  # @movie = ...
  # end
end
