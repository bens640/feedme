class SessionsController < ApplicationController

  def create_user
    @user = User.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @user
      #logged in hooray
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      render action: 'new'
    end
  end

  def create_chef
    @chef = Chef.
      find_by(email: params[:email]).
      try(:authenticate, params[:password])

    if @user
      #logged in hooray
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      render action: 'new'
    end
  end




end
