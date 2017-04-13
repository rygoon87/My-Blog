class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true
  # validates :rating, inclusion: 1..5
end
