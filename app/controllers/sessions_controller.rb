class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name.capitalize}"
      redirect_to "/dashboard"
    else
      flash[:alert] = "Error: your account information could not be verified. Please verify your infornation and try again"
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:success] = "You have been successfully logged out"
    redirect_to '/'
  end

end
