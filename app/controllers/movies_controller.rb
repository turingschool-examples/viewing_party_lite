class MoviesController < ApplicationController

  def index

    if params[:top_rated].present?
      @top_rated_movies = MovieFacade.top_rated
    else params[:keyword]
      

    end
  end
 
  # def search
  #   conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
  #     faraday.headers['api_key'] = ENV['movies_api_key']
  #   end
  # end

  # def top_rated
  #   @user = User.find[:id]
  #   conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
  #     faraday.headers['api_key'] = ENV['movies_api_key']
  #   end
  #   response = conn.get('/movie/top_rated')

  #   data = JSON.parse(response.body, symbolize_names: true)

  #   top_rated_movies = data[:results]

  #   render user_movie_path(@user.id)
  # end
end
