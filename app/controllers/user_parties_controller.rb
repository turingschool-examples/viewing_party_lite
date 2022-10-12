class UserPartiesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])

    # @movie_id = params[:movie_id]
    # conn = Faraday.new(url: "https://api.themoviedb.org") 
    # response = conn.get("/3/movie/#{@movie_id}?api_key=#{ENV["movies_api_key"]}")
    # @movie_information  = JSON.parse(response.body, symbolize_names: true)
  end

  def create
    @user = User.find(params[:id])
    @movie_id = params[:movie_id]
    @party = Party.create!(party_params)
    @movie_party = UserParty.new(user_id: @user.id, party_id: @party.id, is_host: true)
    @movie = MovieFacade.movie_by_id(params[:movie_id])
    # conn = Faraday.new(url: "https://api.themoviedb.org") 
    # response = conn.get("/3/movie/#{@movie_id}?api_key=#{ENV["movies_api_key"]}")
    # @movie_information  = JSON.parse(response.body, symbolize_names: true)
    if @movie.runtime > @party.duration
      redirect_to "/users/#{@user.id}/movies/#{@movie_id}/viewing-party/new"
      flash[:alert] = "The duration can not be shorter than the run time of the movie, silly."
    elsif @movie_party.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  private
  def party_params
      params.permit(:id, :start_time, :duration, :date, :movie_id)
  end
end
