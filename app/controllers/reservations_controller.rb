class ReservationsController < ApplicationController
  before_action :set_reservations, only: [ :current_reservation_user, :my_reservations_user]
  before_action :set_user, only: [:new, :create]
  before_action :require_logged_in
  skip_before_filter :verify_authenticity_token

  include ApplicationHelper
  def index
    @chef_reservations = Reservation.chef(current_chef.id)#where(chef_id:current_chef.id)
    @available_reservations = Reservation.available
    @chef = Chef.find(session[:chef_id])
  end

  def new
    @reservation = Reservation.new
    @recipes = Recipe.all
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

  def create
    @reservation = current_user.reservations.new reservation_params

    # if @reservation.valid?
    #   redirect_to new_charge_path(@reservation), flash:{notice: 'reservation valid. make payment'}

    if @reservation.save
      # byebug
      # @amount = 2000 * @reservation.plates.to_i
      #
      # customer = Stripe::Customer.create(
      #   :email => 'example@stripe.com',
      #   :card  => params[:stripeToken]
      # )
      #
      # charge = Stripe::Charge.create(
      #   :customer    => customer.id,
      #   :amount      => @amount,
      #   :description => 'Rails Stripe customer',
      #   :currency    => 'usd'
      # )
      redirect_to @user, flash:{notice: 'Created reservation'}
    else
      # byebug
      redirect_to :back, flash:{notice:'Make sure required fields are filled'}
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
        permit(:details, :date, :time, :address, :address2, :city, :state, :zip, :phone, :recipe_id, :plates)
  end

  def set_reservations
    @user_reservations = Reservation.where(user_id:current_user.id)
  end
  def set_user
    @user = current_user
  end
end
