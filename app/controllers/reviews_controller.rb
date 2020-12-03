class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user_id = current_user.id
    if @review.save
      redirect_to recipe_path(@review.recipe), notice: "Thank you for reviewing!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :recipe_id, :photo)
  end
end
