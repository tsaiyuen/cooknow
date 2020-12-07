class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates_uniqueness_of :ingredient_id, :scope => [:recipe_id]
end
