class FridgesController < ApplicationController

  def index
    @fridges = current_user.fridges
    #@ingredients = @fridge.ingredients
  end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @fridge.user = current_user
    if @fridge.save
      redirect_to fridge_path(@fridge)
    else
      render "new"
    end
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
