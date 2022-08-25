class MovieController < ApplicationController
    
    def top_rated
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["Authorization"] = Bearer ENV['tmdb_api_key']
        end

        response = conn.get("/3/movie/top_rated?")
        data = JSON.parse(response.body, symbolize_names: true)

        @movies = data[:results]
        render 'movies/results'
    end
        #may edit later below
      def index
    if current_user
      if params[:top_rated]
        @movies = MovieFacade.top_rated
      elsif params[:keyword]
        @keyword = params[:keyword]
        @results = MovieFacade.search_for_movies(@keyword)
      end
    else
      if params[:top_rated]
        @movies = MovieFacade.top_rated
      elsif params[:keyword]
        @keyword = params[:keyword]
        @results = MovieFacade.search_for_movies(@keyword)
      end
    end 
  end

  def show
    if current_user
      @movie = MovieFacade.movie_id(params[:movie_id])
      @cast = MovieFacade.cast(params[:movie_id])
    else
      @movie = MovieFacade.movie_id(params[:movie_id])
      @cast = MovieFacade.cast(params[:movie_id])
    end 
  end

end