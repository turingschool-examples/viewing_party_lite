class PartiesController <ApplicationController
  def new
    #binding.pry
    @user =  User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.movie_show(params[:movie_id])
  end

  def create
    @movie = MovieFacade.movie_show(params[:movie_id])
    #binding.pry
    if params[:duration].to_i <= @movie.runtime
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/parties/new"
      flash.alert = "Error! if the party ends before the movie no one will love you."
    elsif params[:users].count < 1

      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/parties/new"
      flash.alert = "You'll die alone if you don't invite someone."
    else
      #binding.pry
      partytime = Party.create!(movie_id: params[:movie_id], date: params[:date], start: params[:start], duration: params[:duration], user_id: params[:user_id])

      if partytime.save
        params[:users].each do |user|
          UserParty.create!(user_id: user, party_id: partytime.id)
        end
          redirect_to "/users/#{params[:user_id]}"
      else
          #binding.pry
          redirect_to "/users/#{user_id.id}/movies/#{movie_id.id}/parties/new"
          flash[:alert] = "Error: #{error_message(userparty.errors)}"
      end
    end
  end
end
