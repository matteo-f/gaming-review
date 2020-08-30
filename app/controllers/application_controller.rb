class ApplicationController < ActionController::Base
  def require_login
    return head(:forbidden) unless session.include? :user_id
    @current_user ||= User.find(session[:user_id])
  end
end
