class HomeController < ApplicationController
  before_action :set_user, :set_chef
  def index
    @recipes = Recipe.all
  end

  def mobile
    @reservations = Reservation.all
  end
  private
  def set_user
    @user = current_user
  end
  def set_chef
    @chef = current_chef

  end
end
