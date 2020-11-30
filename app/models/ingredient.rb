class Ingredient < ApplicationRecord
  has_many :fridges, :recipe_ingredients

  validates :name, uniqueness: true
end
