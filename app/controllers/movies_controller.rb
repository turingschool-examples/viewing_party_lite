class MoviesController < ApplicationController
  def index 
    # if top rated --- show top rated movies
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
    response = conn.get("/3/movie/top_rated")
  
    data = JSON.parse(response.body, symbolize_names: true)

    @movies = data[:results].map do |result|
      result[:title]
    end
    # if search keywords --- show search results
  end 

  def search
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = ENV['movie_api_key']
    # end
    # response = conn.get("/3/movie/top_rated")
  
    # data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    # members = data[:results][0][:members]

    # found_members = members.find_all {|m| m[:last_name] == params[:search]}
    # @member = found_members.first
    # render "welcome/index"
  end
end