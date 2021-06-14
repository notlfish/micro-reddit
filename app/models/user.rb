class User < ApplicationRecord
  validates :name, presence: true, length: { in: 5..50 }, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { min: 8 }
end
