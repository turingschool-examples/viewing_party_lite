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
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    else
      response = conn.get('3/movie/top_rated')
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    end
  end

  def show
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    movie_response = conn.get("3/movie/#{params[:id]}")
    movie_data = JSON.parse(movie_response.body, symbolize_names: true)

    @movie = movie_data

    cast_response = conn.get("3/movie/#{params[:id]}/credits")
    cast_data = JSON.parse(cast_response.body, symbolize_names: true)

    @cast = cast_data[:cast]

    review_response = conn.get("3/movie/#{params[:id]}/reviews")
    review_data = JSON.parse(review_response.body, symbolize_names: true)

    @reviews = review_data[:results]
  end
end
