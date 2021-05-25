class CreateShips < ActiveRecord::Migration[6.1]
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :capacity
      t.references :port, null: true, foreign_key: true

      t.timestamps
    end
    add_index :ships, :name, unique: true
  end
end
