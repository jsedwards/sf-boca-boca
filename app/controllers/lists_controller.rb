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

  def edit
    @list = List.find(params[:id])
    @list.listings.each do |listing|
      params[listing.restaurant_id] = true
    end
    @restaurants = Restaurant.all
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    @list.save
    @list.listings.destroy_all
    params[:restaurant_ids].each do |r_id|
      @listing = Listing.new
      @listing.list_id = @list.id 
      @listing.restaurant_id = r_id
      @listing.save
    end
    redirect_to lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.listings.destroy_all
    @list.destroy
    redirect_to lists_path
  end


  private
  def list_params
    params[:list].permit(:name)
  end
end