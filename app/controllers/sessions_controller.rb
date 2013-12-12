class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to :root
    else
      redirect_to :root
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end
end