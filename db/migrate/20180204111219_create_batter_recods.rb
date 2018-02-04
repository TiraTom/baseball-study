class CreateBatterRecods < ActiveRecord::Migration[5.1]
  def change
    create_table :batter_recods do |t|
      t.string :name, null:false
      t.float :rate, default: 0
      t.integer :number, default: 0
      t.integer :hit, default: 0
      t.float :ops, default: 0

      t.timestamps
    end
  end
end
