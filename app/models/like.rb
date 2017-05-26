class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :user_id, uniqueness: { scope: :post_id }

  def liked_posts
    likes.find_by_user_id(user)
  end

end
