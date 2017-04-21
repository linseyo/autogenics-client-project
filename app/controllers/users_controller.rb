class UsersController < ApplicationController

  def new
    @user = User.new
    if request.xhr?
      respond_to do |format|
        format.js {}
      end
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    @experiments = Experiment.all
    if @user.save
      session[:user_id] = @user.id
      session[:role] = @user.clearance_levels

      if request.xhr?
        respond_to do |format|
          format.js {}
        end
      else
        redirect_to controller: "experiments", action: "index"
      end
    else
      if request.xhr?
        respond_to do |format|
          @errors = @user.errors

          format.js {render action: 'new'}
        end
      else
        render 'new'
      end
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :access_token)
  end
end
