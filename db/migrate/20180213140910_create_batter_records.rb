class CreateBatterRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :batter_records do |t|
      t.string :name, null:false
      t.float :rate, default: 0
      t.integer :number
      t.integer :hit, default: 0
      t.float :ops, default: 0

      t.timestamps
    end
  end
end
