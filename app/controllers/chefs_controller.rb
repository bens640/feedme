class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :show, :update]
  before_action :require_chef, only:[:edit,:show,:update]
  before_action :is_admin?, only: [:index,:toggle]

  def index
    @chefs_inactive = Chef.where(active:false)
    @chefs_active = Chef.where(active:true)
  end
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params
    if @chef.save
      session[:chef_id] = @chef.id
      # ChefMailer.welcome_email(@chef).deliver
      redirect_to reservations_path, flash:{notice: 'Created chef and logged in'}
    else
      render action: 'new', flash:{notice: 'Please try again'}
    end
  end

  def edit
    @profile = current_chef
  end

  def show
    @chef_old_confirmations = Reservation.chef_old(current_chef)
    @chef_confirmations = Reservation.chef(current_chef)
    @chef_reservations = Reservation.available
    @profile = @chef
  end
  def update
    @chef = Chef.
        find_by(email: @chef[:email]).
        try(:authenticate, chef_params[:old_password])
    if @chef
      if @chef.update(chef_params.except(:old_password))
        redirect_to @chef, notice: 'Chef was successfully updated'
      else
        redirect_to :back, notice: 'something went wrong'
      end
    else
      redirect_to :back, notice: 'Your old password was wrong'
    end
  end
  def toggle
    @chef = Chef.find(chef_id_params[:id])
    @chef.active = !@chef.active
    @chef.save
    redirect_to :back, notice: "Chef's availability has changed"
  end
  private
  def set_chef
    @chef = current_chef
  end
  def chef_id_params
    params.permit(:id)
  end
  def chef_params
    params.
    require(:chef).
    permit(:email, :password,:first_name, :last_name, :password_confirmation, :city, :state, :zip, :phone, :old_password,:id)
  end
end
