class UsersController < ApplicationController

  def new
    # @user = User.new
  end

  def create
    user = User.new(name: params[:name], email: params[:email])

    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "ERROR: #{error_message(user.errors)}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def movies
    # @user = User.find(params[:id])
    #
    # url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1"
    #
    # response = Faraday.get(url)
    #
    # data = JSON.parse(response.body, symbolize_names: true)
    #
    # all_top_movies = data[:results].map do |movie|
    #   Movie.new(movie)
    # end
    #
    # @movies = all_top_movies[0..19]

    @user = User.find(params[:id])

    if params[:q] == 'top rated'
      @movies = MovieFacade.top_movies
    elsif params[:q] == 'keyword'
      @movies = MovieFacade.lookup(params[:title])
    end
  end

  def movie_show
    @user = User.find(params[:id])
    @movie = MovieFacade.details(params[:movie_id])
  end
end
