class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    
    if params[:search] == ''
      redirect_to user_discover_index_path(@user), notice: 'Search field cannot be blank'
    elsif !params[:search].nil?
      response = conn.get("/3/search/movie?query=#{params[:search]}")
    else
      response = conn.get('3/movie/top_rated')
    end
    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results]
  end
end
