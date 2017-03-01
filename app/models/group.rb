class Group < ApplicationRecord
  belongs_to :user
  has_many :use_groups
  has_many :users, through: :user_groups
end
