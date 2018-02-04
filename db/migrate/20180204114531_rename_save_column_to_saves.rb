class RenameSaveColumnToSaves < ActiveRecord::Migration[5.1]
  def change
    rename_column :pitcher_recods, :save, :saves
  end
end
