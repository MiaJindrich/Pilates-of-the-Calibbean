class Port < ApplicationRecord
  has_many :ships, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
