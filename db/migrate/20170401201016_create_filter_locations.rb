class CreateFilterLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :filter_locations do |t|
      t.references :institution, foreign_key: true
      t.string :address
      t.string :city
      t.string :state
      t.integer :pin

      t.timestamps
    end
  end
end
