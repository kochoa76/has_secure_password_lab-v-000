class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.password == @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      return head(:forbidden), alert: "Incorrect password or username"
    end
  end

  def destroy
    session.destroy :name
    redirect_to '/login'
  end


end
