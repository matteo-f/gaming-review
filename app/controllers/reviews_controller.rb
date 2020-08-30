class ReviewsController < ApplicationController
  before_action :require_login

  def index
    @reviews = Review.order('lower(title)').all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]

    if @review.valid?
      @review.save
      @review.game.update_average_score!

      redirect_to user_review_path(session[:user_id], @review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    if session[:user_id] != @review.user.id
      flash[:message] = "You don't have permission to edit this review."

      redirect_to user_review_path(@review.user, @review)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.valid?
      @review.game.update_average_score!

      redirect_to user_review_path(session[:user_id], @review)
    else

      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])

    if review.user_id == session[:user_id] 
      review.destroy
      review.game.update_average_score!

      redirect_to user_path(User.find(session[:user_id]))
    else
      flash[:message] = "You don't have permission to delete this review."

      redirect_to review_path(review)
    end
  end

  def recent_reviews
    @reviews = Review.all
  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :score, :game_name)
  end
end
