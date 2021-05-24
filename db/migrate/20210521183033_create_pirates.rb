class CreatePirates < ActiveRecord::Migration[6.1]
  def change
    create_table :pirates do |t|
      t.string :name
      t.integer :gold, :default => 0
      t.string :status, :default => "commoner"
      t.integer :prestige, :default => 0
      t.references :user, null: false, foreign_key: true
      t.references :ship, null: true, foreign_key: true

      t.timestamps
    end
  end
end
