class SessionsController < ApplicationController
  def new

  end
  def create_user
    @user = User.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @user
      #logged in hooray
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def create_chef
    @chef = Chef.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @chef
      #logged in hooray
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: 'new'
    end
  end
end
