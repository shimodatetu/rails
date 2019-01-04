class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true#, file_size: { less_than_or_equal_to: 1024.kilobytes },
                #file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png'] }
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
