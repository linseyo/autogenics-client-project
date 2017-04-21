class IndexController < ApplicationController

  def index
    @experiments = Experiment.all
    @user = User.new
    if request.xhr?
      if session[:user_id]
        @experiments = Experiment.all
        render partial: "experiments/index"
        else
        render partial: "sessions/index"
      end
    end
  end
end
