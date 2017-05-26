class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                     uniqueness: { case_sensitive: false },
                     format: VALID_EMAIL_REGEX
  before_validation :downcase_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def like_by?(user)
    likes.exists?(user: @user)

  end

  def like_for(user)
    likes.find_by(user: @user)
  end



  private

    def downcase_email
      self.email.downcase! if email.present?
    end
end
