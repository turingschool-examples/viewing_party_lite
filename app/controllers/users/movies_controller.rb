class Users::MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org')

    response = conn.get(type_url[:path]) do |req|
      req.params = query_params
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results].first(20)
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
  end
end
