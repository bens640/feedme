class HomeController < ApplicationController
  before_action :set_user, :set_chef
  def index
    @recipes = Recipe.all
  end
  private
  def set_user
    if current_user
      @user ||= current_user
    end
  end
  def set_chef
    if current_chef
      @chef ||= current_chef
    end
  end
end
