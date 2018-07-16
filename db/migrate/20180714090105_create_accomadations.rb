class CreateAccomadations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomadations do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :spot
      t.integer :price

      t.timestamps
    end
  end
end
