class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, :only => [:new, :create]

  def index
    @reviewers = User.order('lower(username)').all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?

      session[:user_id] = @user.id

      redirect_to homepage_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def top_reviewers
    @top_reviewers = User.top_reviewers
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
