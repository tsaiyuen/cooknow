class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
end
