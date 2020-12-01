class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :reviews
  has_many :saved_recipes
  has_many :ingredients, through: :recipe_ingredients
end
