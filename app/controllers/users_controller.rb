class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  before_action :require_user, only:[:edit,:show,:update]
  before_action :require_logged_in, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      # UserMailer.welcome_email(@user).deliver
      redirect_to @user , flash:{notice: 'created user and logged in'}
    else
      render action: 'new', flash:{notice:'please try again'}
    end
  end

  def edit
    @profile = current_user
  end

  def show
    @user_reservations = Reservation.where(user_id:current_user.id)
    @user = current_user
    @profile = @user
  end

  def update
    @user = User.
        find_by(email: @user[:email]).
        try(:authenticate, user_params[:old_password])
    if @user
      # new_params = user_params.reject{|a| a==""}
      if @user.update(user_params.except(:old_password))
        redirect_to user_path, notice: 'User was successfully updated.'
      else
        redirect_to :back, notice: 'something went wrong'
      end
    else
      redirect_to :back, notice: 'Your old password was wrong'
    end
  end

  private
  def set_user
    @user = current_user
  end
  def user_params
    params.
    require(:user).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone, :old_password)
  end
end
