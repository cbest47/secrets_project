class Secret < ApplicationRecord
  belongs_to :user
  validates :content, presence:true
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
end
