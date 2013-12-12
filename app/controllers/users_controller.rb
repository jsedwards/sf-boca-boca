class UsersController < ApplicationController
  def new
    @user = User.new
    @lists = List.all
    @users = User.all 
  end
  def create
    User.create(params[:user].permit(:name, :email, :password, :password_confirmation))
    redirect_to :root
  end

  def index
    render partial: 'login'
  end
end