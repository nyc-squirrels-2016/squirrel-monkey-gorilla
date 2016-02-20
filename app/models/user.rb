class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "author_id", dependent: :destroy
  has_many :answers, foreign_key: "taker_id"
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password_digest, length: {minimum: 8}

  has_secure_password
end
