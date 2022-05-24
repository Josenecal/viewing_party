class UsersController < ApplicationController
  def new

  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to "/dashboard"
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # def login_form
  # end
  #
  # def login_user
  #   user = User.find_by(email: params[:email])
  #   if user.authenticate(params[:password])
  #     # session[:user_id] = user.id
  #     flash[:success] = "Welcome back, #{user.name.capitalize}"
  #     redirect_to "/users/#{user.id}/"
  #   else
  #     flash[:alert] = "Error: your account information could not be verified. Please verify your infornation and try again"
  #     render :login_form
  #   end
  # end

  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
