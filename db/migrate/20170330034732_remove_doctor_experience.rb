class RemoveDoctorExperience < ActiveRecord::Migration[5.0]
  def up
  	remove_column :clinicals, :experience
  end

  def down
  	add_column :clinicals, :experience
  end
end
