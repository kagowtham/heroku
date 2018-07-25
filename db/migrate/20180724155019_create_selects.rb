class CreateSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :selects do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
