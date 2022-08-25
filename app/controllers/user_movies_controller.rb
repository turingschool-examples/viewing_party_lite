class UserMoviesController < ApplicationController

    def index 
        @user = User.find(params[:id])
        binding.pry 
        if params[:movies] != nil  
            @movies = MovieIndexTopResultFacade.service
        elsif params[:search] == ""
            redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new", notice: "Error: Runtime must be longer than the movie length"
        else 
            @movies = MovieIndexSearchResultFacade.service(params[:search])  
        end 
        
        render 'user_movies/index'
    end

    
end 