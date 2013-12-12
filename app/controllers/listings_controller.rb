class ListingsController < ApplicationController
  def index
    @lists = List.all
  end

end