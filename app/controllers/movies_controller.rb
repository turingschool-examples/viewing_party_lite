class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    connection = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end

    return unless params[:q]

    response = connection.get('/3/movie/top_rated')
    json_body = response.body

    # require 'pry'; binding.pry
    parsed_response = JSON.parse(json_body, symbolize_names: true)
    @results = parsed_response[:results]
  end
end
