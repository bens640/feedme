class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  before_action :require_user, only:[:edit,:show,:update]
  before_action :require_logged_in, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user , flash:{notice: 'created user and logged in'}
    else
      render action: 'new', flash:{notice:'please try again'}
    end
  end

  def edit
    @profile = current_user
  end

  def show
    @user_reservations = Reservation.user(current_user)
    @user = current_user
    @profile = @user
  end

  def update
    @user = User.auth_change(@user,user_params)
    if @user
      if @user.update_attributes(user_params.except(:old_password))
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
        permit(:email, :password,:first_name, :address, :address2, :last_name, :password_confirmation, :city, :state, :zip, :phone, :old_password)
  end
end
