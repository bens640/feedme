class ReservationsController < ApplicationController
  before_action :set_reservations, only: [ :current_reservation_user, :my_reservations_user]
  before_action :require_logged_in

  include ApplicationHelper
  def index
    @chef_reservations = Reservation.chef(current_chef.id)#where(chef_id:current_chef.id)
    @available_reservations = Reservation.available
    @chef = Chef.find(session[:chef_id])
  end

  def new
    @reservation = Reservation.new
  end
  def show
    if current_user
      @reservation = current_user.reservations.find(params[:id])
    elsif current_chef
      @reservation = Reservation.find(params[:id])
    end
    @messages = Message.where(reservation_id: params[:id])
    @r = Reservation.find(params[:id])
    @user = @r.user
    @chef = @r.chef
    @new_reservations_message = Message.new
  end

  def current_reservation_user
  end

  def current_reservation_chef
    @chef_reservations = Reservation.where(chef_id:current_chef.id)
  end

  def my_reservations_user
  end

  def my_reservations_chef
    @chef_reservations = Reservation.where(chef_id:current_chef.id)
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

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path, flash:{notice:"Reservation Removed"}
  end


  private
  def reservation_params
    params.
        require(:reservation).
        permit(:details, :date, :time, :address, :address2, :city, :state, :zip, :phone)
  end
  def set_reservations
    @user_reservations = Reservation.where(user_id:current_user.id)
  end
end
