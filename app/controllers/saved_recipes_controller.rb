class SavedRecipesController < ApplicationController
  def index
    @savedrecipes = SavedRecipe.all
  end

  def new
    @savedrecipe = SavedRecipe.new
    authorize @savedrecipe
  end

  def create
    @savedrecipe = SavedRecipe.new(savedrecipe_params)
    @savedrecipe.user = current_user
    authorize @savedrecipe
    if @savedrecipe.save
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @savedrecipe = SavedRecipe.find(params[:id])
    authorize @savedrecipe
    @savedrecipe.destroy
    redirect_to users_path
  end

  private

  def savedrecipe_params
    params.require(:saved_recipe).permit(:recipe_id)
  end
end
