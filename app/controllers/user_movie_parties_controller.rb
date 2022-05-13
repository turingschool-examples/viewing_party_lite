class UserMoviePartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @users = User.all
    movie_id = params[:movie_id].to_i
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    end 
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_db_key']}")
    @movie = JSON.parse(response.body, symbolize_names: true)
  end

  def create
    user_id = params[:user_id]
    movie_id = params[:movie_id]
    if params[:runtime].to_i > params[:duration].to_i 
      flash[:notice] = 'Duration Cannot Be Less Than Movie Runtime!'
      redirect_to "/users/#{user_id}/movies/#{movie_id}/party/new"
    else 
      new_party = Party.create!({
        duration: params[:duration].to_i,
        when: date_maker,
        start_time: params[:start_time],
        user_id: user_id
      })
      user_attendee = Attendee.create!(user_id: user_id, party_id: new_party.id)  
      if params[:attendees].present?
        params[:attendees].each do |attendee|
          Attendee.create(user_id: attendee, party_id: new_party.id)
        end 
      end 
      redirect_to "/users/#{user_id}"
    end 
  end

  private
    def date_maker
      params['date(1i)'] + '-' + params['date(2i)'] + '-' + params['date(3i)']
    end 
  
  

end 