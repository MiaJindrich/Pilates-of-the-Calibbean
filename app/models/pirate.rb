class Pirate < ApplicationRecord
  belongs_to :user
  belongs_to :ship, optional: true
  #enum status: [ :commoner, :cook]

  validates :name, presence: true
end
