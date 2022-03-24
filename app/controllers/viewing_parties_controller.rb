class ViewingPartiesController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
  end

  def show 
    @viewing_party = ViewingParty.find(params[:id])
  end

  def create
    vp = ViewingParty.new(viewing_party_params)
    if vp.save
      if params[:user].present? 
        params[:user].each do |user| 
          UserViewingParty.create(user_id: user, viewing_party: vp )
        end
      end 
    redirect_to(user_path(vp.user), success: 'Your Viewing Party was successfully created.')
    else 
      flash[:danger] = vp.errors.full_messages
      render 'new'
    end
  end

  private 
  def viewing_party_params
    params.permit(:duration, :date_time, :movie_id, :user_id)
  end
end
