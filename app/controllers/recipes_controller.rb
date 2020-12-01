class RecipesController < ApplicationController
  def index
    if params[:ingredients].present?
      ingredients = params[:ingredients].map(&:to_i)
      @recipes = Recipe.joins(:ingredients).where(ingredients: {id: params[:ingredients]}).uniq
      #Recipe.joins(:ingredients).having('ARRAY[?::bigint] = ARRAY_AGG(ingredients.id)', ingredients)
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end
  end
end
