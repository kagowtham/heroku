class UsersController < ApplicationController



  def index
   render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      #render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname,:email, :password,
                                 :password_confirmation,:types)
  end

end
