class UserMoviePartiesController < ApplicationController

  def new
    # @user = User.find(params[:user_id])
    if current_user
      @users = User.all
      movie_id = params[:movie_id].to_i
      @movie = MovieFacade.movie_id(movie_id)
    else
      render file: "/public/404"   
    end 
  end

  def create
    if current_user
      user_id = current_user.id
      movie_id = params[:movie_id]
      if params[:runtime].to_i > params[:duration].to_i 
        flash[:notice] = 'Duration Cannot Be Less Than Movie Runtime!'
        redirect_to "/movies/#{movie_id}/party/new"
      else 
        new_party = Party.create!({
          duration: params[:duration].to_i,
          when: date_maker,
          start_time: params[:start_time],
          user_id: user_id,
          movie_id: movie_id
        })
        if params[:attendees].present?
          params[:attendees].each do |attendee|
            Attendee.create(user_id: attendee, party_id: new_party.id)
          end 
        end 
        redirect_to "/dashboard"
      end 
    else
      render file: "/public/404"   
    end 
  end

  private
    def date_maker
      params['date(1i)'] + '-' + params['date(2i)'] + '-' + params['date(3i)']
    end 
  
  

end 