class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy

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

  private

   def downcase_email
     self.email.downcase! if email.present?
   end



end
