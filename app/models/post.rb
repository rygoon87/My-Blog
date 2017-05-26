class Post < ApplicationRecord

  has_attached_file :image, styles: { medium: "640x480#", small: "320x240#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title, presence: true, uniqueness: { case_sensitive: false}
  validates :body, { presence: true, }

  # scope :order_by_likes, -> { where() }



  def like_by?(user)
    likes.exists?(user: @user)

  end

  def like_for(user)
    likes.find_by(user: @user)
  end

  def formatted_time
    created_at.strftime('%A, %B %C, %Y')
  end

end
