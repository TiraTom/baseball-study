class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name, null:false
      t.integer :number, null:false
      t.integer :price, default: 0
      t.string :position
      t.integer :bat, default: 0
      t.string :image

      t.timestamps
    end
  end
end
