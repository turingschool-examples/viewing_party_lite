module Users
  class MoviesController < ApplicationController
    def index
      set_user

      conn = Faraday.new(url: "https://api.themoviedb.org/3")

      if params[:q] == 'top rated'

        response = conn.get("discover/movie?api_key=#{ENV['movie_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000")

      elsif params[:commit]

        response = conn.get("search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{params[:title]}&page=1&include_adult=false")

      end

      data = JSON.parse(response.body, symbolize_names: true)

      if data[:success] == false
        flash[:errors] = data[:errors]
        redirect_to user_discover_index_path(@user)
      else
        @movies = data[:results]
      end
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end