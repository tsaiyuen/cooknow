class Recipe < ApplicationRecord
  has_many :recipe_ingredients, :reviews, :saved_recipes
end
