class Users::MoviesController < ApplicationController
  def index
    conn = Faraday.new(
      url: 'https://api.themoviedb.org',
      params: {
        api_key: 'c4d6d86f378d33bacc04481f7e6380b2',
        language: 'en-US'
      }
    )
    # require 'pry'; binding.pry
  end
end
