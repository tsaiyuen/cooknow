class RecipesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:ingredients].present?
      @ingredients = params[:ingredients].map(&:to_i).sort
      @recipes = Recipe.joins(:ingredients).group('recipes.id').having('ARRAY[?::bigint] = ARRAY_AGG(ingredients.id order by ingredients.id)', @ingredients)
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews
    @rating = @reviews.average(:rating).to_i

    if @reviews.present?
      @detailed_rating = @reviews.average(:rating).round(2)
    else
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to recipe_path(@review.recipe)
  end
end
