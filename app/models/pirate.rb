class Pirate < ApplicationRecord
  belongs_to :user
  #enum status: [ :commoner, :cook]
end
