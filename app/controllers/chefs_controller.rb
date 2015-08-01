class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params
    if @chef.save
      session[:chef_id] = @chef.id
      ChefMailer.welcome_email(@chef).deliver
      redirect_to 'reservations#index', flash:{notice: 'Created chef and logged in'}
    else
      render action: 'new', flash:{notice: 'Please try again'}
    end
  end

  def chef_account
    @chef = current_chef
    @chef_reservations = Reservation.where(chef_id:current_chef.id)
  end

  def my_reservations_chef
    @chef_reservations = Reservation.where(chef_id:current_chef.id)
  end


  private
  def chef_params
    params.
    require(:chef).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone)
  end
end
