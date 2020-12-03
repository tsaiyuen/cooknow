class RecipesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:ingredients].present?
      ingredients = params[:ingredients].map(&:to_i).sort
      @recipes = Recipe.joins(:ingredients).group('recipes.id').having('ARRAY[?::bigint] = ARRAY_AGG(ingredients.id order by ingredients.id)', ingredients)
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews
  end
end
