class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_chef, :is_logged_in, :is_admin?, :belongs_to_chef
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
      return true if is_admin?
      redirect_to root_path
      false
    end
    def require_chef
      return true if current_chef
      return true if is_admin?
      redirect_to root_path
      false
    end
    def require_user
      return true if current_user
      redirect_to root_path
      false
    end
    def chef_active?
      current_chef.active
    end
    def is_admin?
      (current_user && current_user.email == 'admin@admin.com') ? true : false
    end
    def belongs_to_or_nil_or_admin
      reservation = Reservation.find(params[:id])
      return true if current_chef && reservation.chef_id == nil
      return true if current_chef && current_chef.id == reservation.chef_id
      return true if current_user && reservation.user_id == current_user.id
      return true if is_admin?
      false
    end
    def belongs_to_user_or_admin
      return true if current_user && current_user.id == Reservation.find(params[:id]).user_id
      return true if is_admin?
      redirect_to root_path
      false
    end
    def belongs_to_user
      return true if current_user.id == User.reservation.find(params[:id])
      redirect_to root_path
      false
    end
end