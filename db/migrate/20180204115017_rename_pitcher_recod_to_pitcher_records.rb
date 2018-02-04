class RenamePitcherRecodToPitcherRecords < ActiveRecord::Migration[5.1]
  def change
    rename_table :pitcher_recods, :pitcher_records
  end
end
