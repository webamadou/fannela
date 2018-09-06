class SessionsController < ApplicationController

  #skip_before_action :only_connected, only: [:new, :create]
  #before_action :only_not_loggedin, only: [:new,:create]

  def new
  end

  def create
    users_params = params.required(:user).permit(:username, :password)
    @user = User.where(username: users_params[:username]).or(User.where(email: users_params[:username])).first
    if (@user && @user.confirmed) && @user.authenticate(users_params[:password])
      session[:auth] = @user.user_session
      redirect_to profil_path, success: "Welcome to you profile!"
    else
      redirect_to new_session_path, danger: "Authentication error"
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path
  end
end
