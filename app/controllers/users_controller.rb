<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 1ab1465486320222759f1dbe1b63ed872136638a
class UsersController < ApplicationController
  def create
    new_user = User.create!(user_params)
    redirect_to "/users/#{new_user.id}"
  end

  def show
    @user = User.find(params[:id])
    @hosts_parties = @user.hosting
  end

  private

    def user_params
      params.permit(:name, :email)
    end
end
<<<<<<< HEAD
=======
class UsersController < ApplicationController 
    def show 
        @user = User.find(params[:id])
        @hosts_parties = @user.hosting
    end 
end 
>>>>>>> 6d1eb516be86393508d1e996ad5dac6310678e6a
=======

>>>>>>> 1ab1465486320222759f1dbe1b63ed872136638a
