class CreatePitcherRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :pitcher_records do |t|
      t.string :name, null:false
      t.float :era, default: 999
      t.integer :hold, default: 0
      t.integer :save_num, default: 0
      t.float :win, default: 0
      t.timestamps
    end
  end
end
