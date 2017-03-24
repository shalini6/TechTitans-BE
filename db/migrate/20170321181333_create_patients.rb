class CreatePatients < ActiveRecord::Migration[5.0]
  def up
    create_table :patients do |t|
    	t.string "first_name"
    	t.string "last_name"
    	t.string "mobile"
    	t.string "password_digest"
    	t.string "gender"
    	t.date   "dob"
    	t.string "address"
    	t.string "blood_grp"
    	t.string "email"
    	t.string "aadhar"
		  t.timestamps
    end

    add_index("patients","mobile")
  end

  def down
  	drop_table :patients
  end

end
