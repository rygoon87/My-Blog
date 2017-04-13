class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, uniqueness: { case_sensitive: false}
  validates :body, { presence: true, }


end
