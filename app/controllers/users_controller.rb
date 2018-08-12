class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.create(user_params)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to 'users/welcome'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
