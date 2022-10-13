class MoviesController < ApplicationController
  def show
#     And I should see the following information about the movie:

#  Movie Title # details
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genre(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information

  end

  def index
    @movies = if params[:search]
                MovieFacade.search_results(params[:search])
              else
                MovieFacade.top_20_movies
              end 
  end


end
