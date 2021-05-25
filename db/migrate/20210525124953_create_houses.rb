class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.integer :price
      t.integer :prestige
      t.references :pirate, null: true, foreign_key: true

      t.timestamps
    end
  end
end
