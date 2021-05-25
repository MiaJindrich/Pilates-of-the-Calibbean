class Ship < ApplicationRecord
  has_many :pirates, dependent: :nullify
  belongs_to :port, optional: true

  validates :name, presence: true, uniqueness: true
end
