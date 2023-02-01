class Users::MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    require 'pry'; binding.pry
    response = conn.get(type_url[:path]) do |req|
      req.params = query_params
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end
end

private

def type_url
  params.permit(:path)
end

def query_params
  if params[:type] == 'top'
    { api_key: 'c4d6d86f378d33bacc04481f7e6380b2',
      language: 'en' }
  elsif params[:type] == 'search'
    { api_key: 'c4d6d86f378d33bacc04481f7e6380b2',
      language: 'en',
      query: params[:title] }
  end
end
