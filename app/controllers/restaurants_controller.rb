class RestaurantsController < ApplicationController
  before_action :get_lists
  before_filter :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to @restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  private
  def get_lists
    @lists = List.all
  end

  def restaurant_params
   params.require(:restaurant).permit(:name, :description, :website, :cuisine, :address, :reservations, :hours)
  end 

  def authenticate_admin
    redirect_to restaurants_path unless admin?
  end
end