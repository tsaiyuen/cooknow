class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    authorize @review
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    if @review.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
