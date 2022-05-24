class UsersController < ApplicationController
  def new

  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      redirect_to "/users/#{new_user.id}/"
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
