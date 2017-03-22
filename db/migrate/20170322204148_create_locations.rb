class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
    	t.integer "institution_id"
    	t.string "address"
    	t.string "city"
    	t.string "state"
    	t.integer "pin"
      t.timestamps
    end
  end
end
