class DashboardController < ApplicationController

  def user_dashboard
    if session[:user_id] == nil
      flash[:alert] = "Sorry - you must be logged in before you visit your dashboard"
      redirect_to "/"
    elsif User.find(session[:user_id]) == nil
      session.destroy
      flash[:alert] = "Something went wrong! For security, you've been logged out. Please try loggin in again. If this problem persists, please contact the administrators"
      redirect_to "/"
    else
      @user = User.find(session[:user_id])
    end
  end

end
