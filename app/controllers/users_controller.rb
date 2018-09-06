class UsersController < ApplicationController

  skip_before_action :only_connected, only: [:new,:create,:confirm]
  helper_method
  def new
    @user = User.new
  end

  def create
    user_param = params.require(:user).permit(:username, :email, :password, :password_confirmation)

    @user = User.new(user_param)
    if @user.valid?
      @user.save
      UserMailer.confirm(@user).deliver_now
      redirect_to new_user_path, success: 'Account created you should receive your confirmation email now'
    else
      render 'new'
    end
  end

  def confirm
    @user = User.find(params[:id])
    if @user.confirmation_token == params[:token]
      @user.update_attributes(confirmation_token: nil, confirmed: true )
      @user.save(validate: false)
      session[:auth] = {id: @user.id}
      redirect_to user_path, success: 'Your account is now activated'
    else
      redirect_to new_session_path, danger: 'Invalid token'
    end
  end

  def profil
    @user = current_user
  end

  def update
    users_params = params.require(:user).permit(:username,:email,:firstname, :name, :avatar_file)
    if @user.update_attributes users_params
      redirect_to profil_path, success: "Modifications saved"
    else
      redirect_to profil_path, danger: "Error on edition"
    end
  end

  def show
    @user = current_user
    @path = @user.avatar_path
  end

end