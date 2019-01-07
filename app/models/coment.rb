class Coment < ApplicationRecord
  validates :content, presence: true
  belongs_to :topic
end
