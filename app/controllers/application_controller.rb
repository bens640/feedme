class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_chef
    @current_chef ||= Chef.find_by(id: session[:chef_id])
  end

  def require_logged_in
    return true if current_chef || current_user

    redirect_to root_path
    return false
  end
end
