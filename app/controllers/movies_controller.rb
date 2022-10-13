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
    @user = User.find(params[:id])
  end


end
