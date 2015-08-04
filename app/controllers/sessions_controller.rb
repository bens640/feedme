class SessionsController < ApplicationController
  before_action
  def new_user

  end
  def new_chef

  end
  def login_user
    @user = User.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      if @user.id == 1
        redirect_to root_path, flash:{notice:'you are logged in as a admin'}
      else
        redirect_to new_reservation_path(@user), flash:{notice:"#{@user.first_name} you are logged in as a user"}
      end
    else
      redirect_to login_user_path, flash:{notice:"please try to login again"}
    end
  end

  def login_chef
    @chef = Chef.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @chef
      session[:chef_id] = @chef.id
      redirect_to reservations_path, flash:{notice:"#{@chef.first_name} you are logged in as a chef"}
    else
      redirect_to login_chef_path, flash:{notice:"please try to login again"}
    end
  end

  def destroy
    reset_session
    redirect_to root_path, flash:{notice: "You are logged out."}
  end
end
