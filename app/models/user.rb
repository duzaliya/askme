class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_email, :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40}, format: { with: /\A\w+\z/ }
  validates :header_color, format: { with: /\A#\w{6}\z/ }

  has_many :questions, dependent: :delete_all

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def to_param
    nickname
  end
  
  private

  def downcase_email
    email.downcase!
  end

  def downcase_nickname
    nickname.downcase!
  end
end
