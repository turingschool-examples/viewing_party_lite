class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MovieService.top_rated[:results][0..20]
    else
      params[:movie_id]
      @movies = MovieService.movie_id
    end
  end
end

# connection = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
#   faraday.params['api_key'] = ENV['movies_api_key']
# end

# return unless params[:q]

# response = connection.get('/3/movie/top_rated')
# json_body = response.body

# # require 'pry'; binding.pry
# parsed_response = JSON.parse(json_body, symbolize_names: true)
# @results = parsed_response[:results]
