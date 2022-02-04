class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @keyword = params[:keyword]
    @query = CGI.escape "#{@keyword}"
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #     faraday.params[:api_key] = ENV['movies_api_key']
    # end
    # response = conn.get("/3/search/movie?api_key=#{conn.params[:api_key]}&query=#{@query}")
    if @query.present?
      @movie_info = MovieFacade.movies_searched(@query)

      # search_response = conn.get("/3/search/movie?&query=#{@query}")
      # @movie_results = JSON.parse(search_response.body, symbolize_names: true)

      # @movie_info = @movie_results[:results].map do |info|
      #   [info[:title], info[:id], info[:vote_average]]
      # end

    else
      @top_rated_movies = MovieFacade.top_movies

    #   top_rated_response_page_1 = conn.get("/3/movie/top_rated")
    #   @top_rated_movies_page_1 = JSON.parse(top_rated_response_page_1.body, symbolize_names: true)
    #
    #   top_rated_response_page_2 = conn.get("/3/movie/top_rated?&page=2")
    #   @top_rated_movies_page_2 = JSON.parse(top_rated_response_page_2.body, symbolize_names: true)
    #
    #   @top_40_movies = @top_rated_movies_page_1[:results].push(@top_rated_movies_page_2[:results]).flatten
    #   @top_movie_details = @top_40_movies.map do |movie_details|
    #     [movie_details[:title], movie_details[:vote_average], movie_details[:id]]
    #   end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie_id = params[:id]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params[:api_key] = ENV['movies_api_key']
      end
    # response = conn.get("/3/search/movie?api_key=#{conn.params[:api_key]}&query=#{@query}")
    movie_id_response = conn.get("/3/movie/#{@movie_id}")
    @movie = JSON.parse(movie_id_response.body, symbolize_names: true)

    cast_response = conn.get("/3/movie/#{@movie_id}/credits")
    @cast = JSON.parse(cast_response.body, symbolize_names: true)
    cast_names = @cast[:cast].map do |person|
      [person[:name], person[:character]]
    end
    @top_10_cast = cast_names[0..10]

    reviews_response = conn.get("/3/movie/#{@movie_id}/reviews")
    @reviews = JSON.parse(reviews_response.body, symbolize_names: true)
    @review_count = @reviews.count
    @reviewers = @reviews[:results].map do |review|
      [review[:author], review[:content]]
    end
  end
end
