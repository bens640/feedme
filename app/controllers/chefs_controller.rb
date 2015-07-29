class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      redirect_to root_path, notice: 'Created chef'
    else
      render action: 'new'
    end
  end

  private
  def chef_params
    params.
    require(:chef).
    permit(:email, :email_confirmation, :password, :password_confimation)
  end
end
