module ApplicationHelper
  def signed_in?
    if session[:user_id]
      return true
    else
      false
    end
  end
end
