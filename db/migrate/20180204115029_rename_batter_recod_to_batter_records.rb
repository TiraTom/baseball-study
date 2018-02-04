class RenameBatterRecodToBatterRecords < ActiveRecord::Migration[5.1]
  def change
    rename_table :batter_recods, :batter_records
  end
end
