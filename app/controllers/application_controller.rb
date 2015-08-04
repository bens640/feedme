class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_chef, :is_logged_in, :is_admin?
  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_chef
      @current_chef ||= Chef.find_by(id: session[:chef_id])
    end
    def is_logged_in
      current_chef || current_user
    end
    def require_logged_in
      return true if (current_chef || current_user)
      redirect_to root_path
      false
    end
    def require_chef
      return true if current_chef
      redirect_to root_path
      false
    end
    def require_user
      return true if current_user
      redirect_to root_path
      false
    end
    def is_admin?
      (current_user && current_user.email == 'admin@admin.com') ? true : false
    end
end