class User < ApplicationRecord
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret 
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }
  validates :name, :email, :password, presence:true
end
