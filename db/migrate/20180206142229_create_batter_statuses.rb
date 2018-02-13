class CreateBatterStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :batter_statuses do |t|
      t.string :name, null:false
      t.float :rate, default: 0
      t.integer :number
      t.integer :hit, default: 0
      t.float :opt, default: 0

      t.timestamps
    end
  end
end
