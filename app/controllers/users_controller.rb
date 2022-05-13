# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    movie_ids = @user.parties.map { |party| party.movie_id }
    @movies = []
    movie_ids.each do |id|
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      end 
      response = conn.get("/3/movie/#{id}?api_key=#{ENV['movie_db_key']}")
      @movies << JSON.parse(response.body, symbolize_names: true)
    end 
    @movies 


  end

  def new; end

  def create
    User.create(new_user_params)
    @user = User.where(email: new_user_params[:email]).first
    redirect_to "/users/#{@user.id}"
  end
    
  def discover
    @user = User.find(params[:id])
  end

  private

  def new_user_params
    params.permit(:name, :email)
  end

end
