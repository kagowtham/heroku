class AddColumnInineries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries,:accomadation_id,:integer
  end
end
