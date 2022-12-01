class UsersController < ApplicationController
   def new
   end

   def create
      user = User.create(user_params)
      if user.save
         redirect_to user_path(user.id)
      else
         redirect_to "/register"
      end   
   end

   def show
      @user = User.find(params[:id])
   end

   private

   def user_params
      params.require(:user).permit(:name, :email)
   end
end