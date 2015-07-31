class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params
    if @chef.save
      session[:chef_id] = @chef.id
      redirect_to 'reservations#index', flash:{notice: 'Created chef and logged in'}
    else
      render action: 'new', flash:{notice: 'Please try again'}
    end
  end

  private
  def chef_params
    params.
    require(:chef).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone)
  end
end
