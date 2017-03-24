class CreatePatients < ActiveRecord::Migration[5.0]
  def up
    create_table :patients do |t|
    	t.string "first_name", :limit => 50, :null => false
    	t.string "last_name", :limit => 50, :null => false
    	t.string "mobile", :limit =>10, :null => false
    	t.string "password", :limit =>40
    	t.string "gender", :limit =>1
    	t.date   "dob"
    	t.string "address", :limit=> 150
    	t.string "b_grp", :limit => 2
    	t.string "email", :limit =>100
    	t.string "aadhar", :limit => 12
    	t.datetime "created_at"
    	t.datetime "updated_at"
		
		 t.timestamps
    end

    add_index("patients","mobile")
    add_index("patients","email")
  end

  def down
  	drop_table :patients 
  end

end
