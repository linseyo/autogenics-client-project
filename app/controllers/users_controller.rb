class UsersController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      session[:role] = @user.clearance_levels

      redirect_to controller: "experiments", action: "index"
    else
      p @user.errors
      @errors = @user.errors
      render 'new'
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :access_token)
  end
end
