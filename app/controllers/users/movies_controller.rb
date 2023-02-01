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

    def show
      set_user

      conn = Faraday.new(url: "https://api.themoviedb.org/3")

      movie_response = conn.get("movie/#{params[:id]}?api_key=#{ENV['movie_api_key']}&language=en-US")

      credits_response = conn.get("movie/#{params[:id]}/credits?api_key=#{ENV['movie_api_key']}&language=en-US")

      @movie = JSON.parse(movie_response.body, symbolize_names: true)

      credits = JSON.parse(credits_response.body, symbolize_names: true)

      @runtime = "#{@movie[:runtime] / 60}hr #{@movie[:runtime] % 60}min"

      @genres = @movie[:genres].map { |genre| genre[:name] }

      @cast = credits[:cast][0..9]
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end