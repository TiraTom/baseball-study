class CreatePitcherRecods < ActiveRecord::Migration[5.1]
  def change
    create_table :pitcher_recods do |t|
      t.string :name, null:false
      t.float :era, default: 999
      t.integer :hold, default: 0
      t.integer :save, default: 0
      t.float :win, default: 0

      t.timestamps
    end
  end
end
