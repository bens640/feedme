class ReservationsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :require_logged_in
  before_action :require_chef, only: :index
  before_action :belongs_to_or_nil_or_admin, only: :show
  before_action :belongs_to_user_or_admin, only: :destroy
  skip_before_filter :verify_authenticity_token

  include ApplicationHelper
  def index
    @chef_reservations = Reservation.chef(current_chef)
    # @chef_old_reservations = Reservation.chef_old(current_chef)
    @available_reservations = Reservation.available
    @chef = Chef.find(session[:chef_id])
    # byebug
  end

  def new
    @reservation = Reservation.new
    @recipes = Recipe.all
    @selected = params[:format]
  end

  def show
    if current_user
      @reservation = current_user.reservations.find(params[:id])
    elsif current_chef
      @reservation = Reservation.find(params[:id])
    end
    @messages = Message.where(reservation_id: params[:id]).includes(:user, :chef)
    @user = @reservation.user
    @chef = @reservation.chef
    @new_reservations_message = Message.new
  end

  def create
    @reservation = current_user.reservations.new reservation_params.except(:stripeToken, :amount)
    if @reservation.save
      customer = Stripe::Customer.create(
        :email => reservation_params[:stripeEmail],
        :card  => reservation_params[:stripeToken]
      )

      Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => reservation_params[:amount],
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
      redirect_to @user, flash:{notice: 'Created reservation'}
    else
      redirect_to :back, flash:{notice:' You were not charged please make sure required fields are filled'}
    end
  end
  def update
    reservation = Reservation.find(params.require(:id))
    if reservation.update(chef_id:current_chef.id)
      redirect_to :back, flash:{notice:"Reservation Confirmed"}
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.canceled = true
    @reservation.save
    redirect_to root_path, flash:{notice:"Reservation Removed"}
  end

  private
  def reservation_params
    params.
        require(:reservation).
        permit(:details, :date, :stripeEmail, :stripeToken, :amount, :time, :address, :address2, :city, :state, :zip, :phone, :recipe_id, :plates)
  end
  def set_user
    @user = current_user
  end
end
