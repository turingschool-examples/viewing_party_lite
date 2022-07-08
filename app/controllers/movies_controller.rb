class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    # conn = Faraday.new(url: 'https://api.themoviedb.org') do | faraday |
    #   faraday.params['api_key'] = ENV['movie_api_key']
    # end

    # response_1 = conn.get("/3/movie/top_rated?page=1")
    # response_2 = conn.get("/3/movie/top_rated?page=2")

    # data_1 = JSON.parse(response_1.body, symbolize_names: true)
    # data_2 = JSON.parse(response_2.body, symbolize_names: true)
    # combo_data = data_1[:results] + data_2[:results]
    require "pry"; binding.pry
    movies_top_40 = combo_data.map do | movie_data |
      Movie.new(movie_data)
    end
  end
end
