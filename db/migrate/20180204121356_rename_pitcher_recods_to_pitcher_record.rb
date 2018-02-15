class RenamePitcherRecodsToPitcherRecord < ActiveRecord::Migration[5.1]
  def change
    rename_table :pitcher_records, :PitcherRecord
  end
end
