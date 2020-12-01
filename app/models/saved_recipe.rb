class SavedRecipe < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :recipe
end
