class CreatePorts < ActiveRecord::Migration[6.1]
  def change
    create_table :ports do |t|
      t.string :name
      t.integer :docks

      t.timestamps
    end
    add_index :ports, :name, unique: true
  end
end
