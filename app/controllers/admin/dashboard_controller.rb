# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    before_action :find_admin_user

    def index
      @users = User.default_users
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def verify_admin_user
      return unless @admin_user.role != 'admin'

      redirect_to root_path
      flash[:alert] = 'You must be admin to access the previous page'
    end

    def find_admin_user
      @admin_user = User.find(session[:user_id])
      verify_admin_user
    end
  end
end
