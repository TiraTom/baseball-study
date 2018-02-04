class RenamePlayersToPlayer < ActiveRecord::Migration[5.1]
  def change
    rename_table :players, :Player
  end
end
