class UsersController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.create(user_params)

    redirect_to controller: "experiments", action: "index"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :access_token)
  end
end
