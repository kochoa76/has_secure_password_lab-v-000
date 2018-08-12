class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'welcome'
    else
      return head(:forbidden), alert: "Incorrect password or username"
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy
    session.destroy :name
    redirect_to '/login'
  end


end
