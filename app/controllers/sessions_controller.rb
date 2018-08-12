class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    return head(:forbidden) unless @user.authenticate(params[:password])
  end

  def destroy
    session.destroy :name
    redirect_to '/login'
  end


end
