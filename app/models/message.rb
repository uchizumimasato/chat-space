class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body, presence: true
  mount_uploader :image, ImageUploader
end
