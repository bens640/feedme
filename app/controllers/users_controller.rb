class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @page_current = true
  end
  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      # UserMailer.welcome_email(@user).deliver
      redirect_to root_path , flash:{notice: 'created user and logged in'}
    else
      render action: 'new', flash:{notice:'please try again'}
    end
  end

  def user_account
    @user = current_user
    @user_reservations = Reservation.where(user_id:current_user.id)
  end

  def my_reservations_user
    @user = current_user
    @user_reservations = Reservation.where(user_id:current_user.id)
    @current_messages = Message.where(reservation_id:(params[:id]))

  end

  private
  def user_params
    params.
    require(:user).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone)
  end
end
