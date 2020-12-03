class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_one_attached :photo

  validates :rating, length: { in: 1..5 }
  validates :comment, length: { in: 6..200 }
end
