class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])

    if params[:top_rated]
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
        f.params['api_key'] = ENV['movie_api_key']
      end
      response = conn.get('/3/discover/movie?')

      data = JSON.parse(response.body, symbolize_names: true)

      results = data[:results].find_all do |movie|
        movie[:title].downcase.include?(params[:query].downcase)
      end

      @top_20 = results.first(20)

      if results.empty?
        flash[:notice] = 'No results found. Please try another title.'
        redirect_to discover_user_path(@user)
      end

    else
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
        f.params['api_key'] = ENV['movie_api_key']
      end

      response = conn.get('/3/movie/top_rated?')

      data = JSON.parse(response.body, symbolize_names: true)

      @top_20 = data[:results].first(20)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
