class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :danger
  helper_method :custom_current_user, :user_signed_in?

  protect_from_forgery
  layout :layout_by_resource

  def only_connected
    if !custom_current_user
      redirect_to new_session_path, danger: "You don't have access"
    end
  end

  def only_not_loggedin
    if custom_current_user
      redirect_to profil_path
    end
  end

  def custom_current_user
    return nil if !session[:auth] || !session[:auth]['id']
    return @user if @user
    @user = User.find_by_id(session[:auth]['id'])
  end

  def user_signed_in?
    custom_current_user.nil?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password, :password_confirmation)
    end
  end

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "devise"
    else
      "application"
    end
  end
end
