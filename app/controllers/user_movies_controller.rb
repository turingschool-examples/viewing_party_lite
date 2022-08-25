class UserMoviesController < ApplicationController

    def index 
        @user = User.find(params[:id])
        
        if params[:movies] != nil  
            @movies = MovieIndexTopResultFacade.service
        else 
            @movies = MovieIndexSearchResultFacade.service(params[:search])  
        end 
        
        render 'user_movies/index'
    end

    
end 