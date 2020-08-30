class WelcomeController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:welcome]

  def welcome
    if session[:user_id]
      redirect_to homepage_path
    end
  end

  def index
    @user = User.find(session[:user_id])
  end
end
