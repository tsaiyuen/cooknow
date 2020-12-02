class RecipesController < ApplicationController
  def index
    if params[:ingredients].present?
      ingredients = params[:ingredients].map(&:to_i).sort
      @recipes = Recipe.joins(:ingredients).group('recipes.id').having('ARRAY[?::bigint] = ARRAY_AGG(ingredients.id order by ingredients.id)', ingredients)
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end
  end

  def show
  end
end
