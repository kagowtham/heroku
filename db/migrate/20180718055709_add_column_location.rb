class AddColumnLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :accomadations, :location_id, :integer
  end
end
