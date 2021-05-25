class House < ApplicationRecord
  belongs_to :pirate, optional: true

  before_create :generate_value

  private
  def generate_value
    random = rand(100...12000)
    self.price = random * 10
    self.prestige = random * 5
  end
end
