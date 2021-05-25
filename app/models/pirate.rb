class Pirate < ApplicationRecord
  belongs_to :user
  belongs_to :ship, optional: true
  has_many :houses, dependent: :nullify

  validates :name, presence: true
end
