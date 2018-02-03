class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :img
      t.integer :enterYear, null: false

      t.timestamps
    end
  end
end
