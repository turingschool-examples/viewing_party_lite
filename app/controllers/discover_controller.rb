class DiscoverController < ApplicationController
    def index
      @movies = MoviesFacade.get_movies(params[:user_id])
    end

end

#consume api
# 1- set up service
# -set up the connection
# -make the call
#
# 2- set up the poros
# -defi initialize
# -attr reader
#
# 3- set up the facades
# convert the json into ruby object
#end
