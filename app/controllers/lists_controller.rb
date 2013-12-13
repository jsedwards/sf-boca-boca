 class ListsController < ApplicationController
  def new
    @restaurants = Restaurant.all 
    @list = List.new
  end

  def create
    @list  = List.create(list_params)
    params[:restaurant_ids].each do |r_id|
      @listing = Listing.new
      @listing.list_id = @list.id 
      @listing.restaurant_id = r_id
      @listing.save
    end
    redirect_to listings_path
  end

  def index
    @lists = List.all
  end

  def show 
    @list = List.find(params[:id])
  end


  private
  def list_params
    params[:list].permit(:name)
  end
end