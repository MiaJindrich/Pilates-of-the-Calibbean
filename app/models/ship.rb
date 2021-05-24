class Ship < ApplicationRecord
  has_many :pirates, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
