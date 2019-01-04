class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:15}
  validates :email, presence: true, format: { with: /\A[\w]+@[a-z]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, length: { in: 8..32 }, format: { with: /\A[a-zA-Z0-9]+\z/ }

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
