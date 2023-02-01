module Users
  class MoviesController < ApplicationController
    def index
      set_user

      conn = Faraday.new(url: "https://api.themoviedb.org/3")

      if params[:q] == 'top rated'

        response = conn.get("discover/movie?api_key=2f8f6c343a2a2acbd770dfbfbb00e38a&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000")

      elsif params[:commit]

        response = conn.get("search/movie?api_key=2f8f6c343a2a2acbd770dfbfbb00e38a&language=en-US&query=#{params[:title]}&page=1&include_adult=false")

      end

      data = JSON.parse(response.body, symbolize_names: true)

      @movies = data[:results]
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end