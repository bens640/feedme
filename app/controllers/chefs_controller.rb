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

  def show
    @chef = Chef.new
    if @chef.save
      redirect_to root_path notice: 'Logged in'
    else
      render action: 'chefsign'
    end
  end

  private
  def chef_params
    params.
    require(:chef).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone)
  end
end
