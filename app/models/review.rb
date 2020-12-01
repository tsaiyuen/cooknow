class Review < ApplicationRecord
  belongs_to :recipe, depentent: :destroy
  belongs_to :user

  validates :rating, length: { in: 1..5 }
  validates :comment, length: { in: 6..200 }
end
