class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 6..20 }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_many :posts
end
