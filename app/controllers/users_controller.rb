class UsersController < ApplicationController 

    def show 
        @user = User.find(params[:id])
    end

    def new

    end

    def create
        if user_params[:first_name] == "" || user_params[:last_name] == ""
            redirect_to "/register", notice: "Error: Please complete all fields"
        elsif user_params[:email].include?("@") == false
            redirect_to "/register", notice: "Error: Invalid email address"
        elsif User.exists?(email: user_params[:email].downcase)
            redirect_to "/register", notice: "Error: Email address is taken"
        else
            user = User.create(user_params)
            redirect_to "/users/#{user.id}", notice: "User #{user.email} successfully created!"
        end
    end

    def search 
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end

        if params[:movies] != nil  
            response1 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
            response2 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=2")
        else 
            response1 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{params[:search]}&page=1")
            response2 = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{params[:search]}&page=2")
        end 
        
        data1 = JSON.parse(response1.body, symbolize_names: true)
        data2 = JSON.parse(response2.body, symbolize_names: true)

        @movies = data1[:results].concat(data2[:results])

        render 'users/movies'
        # redirect_to "/users/#{params[:user_id]}/movies/?=#{params[:search]}"
    end
    
    def movie_show
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end

        response1 = conn.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")

        cast_response = conn.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")
        
        @user = User.find(params[:user_id])

        @movie_data = JSON.parse(response1.body, symbolize_names: true)

        @cast = JSON.parse(cast_response.body, symbolize_names: true)

        # require 'pry'; binding.pry 
    end

    # def top_movies
    #     redirect_to "/users/#{params[:user_id]}/movies/?=top%20rated"
    # end 

    private
    def user_params
        params.permit(:first_name,:last_name,:email)
    end

end 