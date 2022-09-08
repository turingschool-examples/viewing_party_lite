class UserMoviesController < ApplicationController

    def index 
        @user = User.find(params[:id])
     
        if params[:movies] != nil  
            @movies = MovieIndexTopResultFacade.service
        elsif params[:search] == ""
            redirect_to "/users/#{params[:user_id]}/discover", notice: "Error: Search form cannot be blank"
        else 
            @movies = MovieIndexSearchResultFacade.service(params[:search])  
        end 
    end

    
end 