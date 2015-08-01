class ReservationsController < ApplicationController
  include ApplicationHelper
  def index
    @chef_reservations = Reservation.where(chef_id:current_chef.id)
    @available_reservations = Reservation.available
    @chef = Chef.find(session[:chef_id])
  end

  def new
    @reservation = Reservation.new
  end
  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = current_user.reservations.new reservation_params

    if @reservation.save
      redirect_to root_path, notice: 'Created reservation'
    else
      render action: 'new'
    end
  end
  def update
    reservation = Reservation.find(params.require(:id))
    if reservation.update(chef_id:current_chef.id)
      redirect_to root_path, flash:{notice:"Reservation Confirmed"}
    end
  end

  private
  def reservation_params
    params.
        require(:reservation).
        permit(:details, :date, :time, :address, :address2, :city, :state, :zip, :phone)
  end
end
