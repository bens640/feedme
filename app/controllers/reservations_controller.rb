class ReservationsController < ApplicationController



	def index

  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new reservation_params

    if @reservation.save
      redirect_to root_path, notice: 'Created reservation'
    else
      render action: 'new'
    end
  end

  private
  def reservation_params
    params.
        require(:reservation).
        permit(:details, :date, :time, :address, :address2, :city, :state, :zip, :phone)
  end

end
