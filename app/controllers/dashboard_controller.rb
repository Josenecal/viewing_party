class DashboardController < ApplicationController

  def user_dashboard
    @user = User.find(session[:user_id])
  end

end
