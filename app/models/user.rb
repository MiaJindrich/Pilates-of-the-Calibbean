class User < ApplicationRecord
  has_secure_password
  has_many :pirates, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
end
