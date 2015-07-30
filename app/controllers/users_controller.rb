class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path notice: 'created user'
    else
      render action: 'new'
    end
  end

  def edit
  end

  private
  def user_params
    params.
    require(:user).
    permit(:email, :password,:first_name, :last_name, :password_confirmation)
  end
end
