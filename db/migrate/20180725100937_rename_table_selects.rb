class RenameTableSelects < ActiveRecord::Migration[5.2]
  def change
    rename_table :selects, :itineraries
  end
end
