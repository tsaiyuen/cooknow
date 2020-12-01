class FridgesController < ApplicationController

  def index
    @fridges = current_user.fridges
    @ingredients = Ingredients.all
    #@ingredients = @fridge.ingredients
  end

  def create
    ingredients = Ingredient.where(id: params[:ingredients])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def fridge_params
    params.require(:fridge).permit(:ingredient_id)
  end
end
