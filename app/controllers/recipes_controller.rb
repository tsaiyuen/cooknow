class RecipesController < ApplicationController
  def index
    if params[:ingredients].present?
      @recipes = Recipe.left_outer_joins(:ingredients).where(ingredients: {id: params[:ingredients]})
    else
      redirect_to root_path, alert: "Please insert ingredients"
    end
  end
end
