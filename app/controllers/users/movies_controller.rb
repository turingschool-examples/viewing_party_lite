class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org')

    response = conn.get(type_url[:path]) do |req|
      req.params = query_params
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results].first(20)
  end

  def show
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    #binding.pry
    response = conn.get(type_url[:path]) do |req|
      req.params = query_params
    end
    cast_response = conn.get("/3/movie/#{params[:id]}/credits") do |req|
      req.params = { api_key: ENV['tmdb_api_key'],
                     language: 'en' }
    end
    reviews_response = conn.get("/3/movie/#{params[:id]}/reviews") do |req|
      req.params = { api_key: ENV['tmdb_api_key'],
                     language: 'en' }
    end

    json = JSON.parse(response.body, symbolize_names: true)
    cast_json = JSON.parse(cast_response.body, symbolize_names: true)
    reviews_json = JSON.parse(reviews_response.body, symbolize_names: true)

    cast = cast_json[:cast].first(10)
    reviews = reviews_json[:results]

    #binding.pry
    @movie = Movie.new(json, cast, reviews)
  end
end

private

def type_url
  params.permit(:path)
end

def query_params
  if params[:type] == 'top'
    { api_key: ENV['tmdb_api_key'],
      language: 'en' }
  elsif params[:type] == 'search'
    { api_key: ENV['tmdb_api_key'],
      language: 'en',
      query: params[:title] }
  elsif params[:type] == 'show'
    { api_key: ENV['tmdb_api_key'],
      language: 'en',
      movie_id: params[:id] }
  end
end
