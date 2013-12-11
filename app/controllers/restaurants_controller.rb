class RestaurantsController < ApplicationController
  before_action :get_lists

  def index
    @restaurants = Restaurant.all 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def get_lists
    @lists = List.all
  end
end