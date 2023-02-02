class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.discover(type_url[:path], query_params)
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details(details_url, query_params)
  end
end

private

def details_url
  "/3/movie/#{params[:id]}"
end

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
