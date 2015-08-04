class HomeController < ApplicationController
  before_action :set_user, :set_chef
  def index
  end
  private
  def set_user
    @user = current_user
  end
  def set_chef
    @chef = current_chef
  end
end
