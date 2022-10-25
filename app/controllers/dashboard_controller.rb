class DashboardController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @user = User.find(params[:user_id])
  end
end
