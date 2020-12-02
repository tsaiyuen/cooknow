class SavedRecipesController < ApplicationController
  def index
    @savedrecipes = SavedRecipe.all
    #authorize @savedrecipe
  end

  def new
    @savedrecipe = SavedRecipe.new
    authorize @savedrecipe
  end

  def create
    @savedrecipe.user = current_user
  end
end
