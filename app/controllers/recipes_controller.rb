class RecipesController < ApplicationController
  def index
    if params[:ingredients].present?
      ingredients = params[:ingredients].map(&:to_i)
      @recipes = Recipe.joins(:ingredients).group('recipes.id').having('ARRAY[?::bigint] = ARRAY_AGG(ingredients.id)', params[:ingredients].map(&:to_i))
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end
  end
end
