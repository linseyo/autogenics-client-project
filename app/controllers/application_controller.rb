class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_clearance_levels
    session[:role] || :guest
  end
end
