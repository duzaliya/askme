class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/}
  validates :nickname, uniqueness: true, length: {maximum: 40}, format: { with: /\A[\w]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
