class RenameBatterRecodsToBatterRecord < ActiveRecord::Migration[5.1]
  def change
    rename_table :batter_records, :BatterRecord
  end
end
