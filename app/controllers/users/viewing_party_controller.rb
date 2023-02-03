class Users::ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details("/3/movie/#{params[:movie_id]}", { api_key: ENV['tmdb_api_key'],
                                                                    language: 'en', 
                                                                    movie_id: params[:movie_id] })
  end
end