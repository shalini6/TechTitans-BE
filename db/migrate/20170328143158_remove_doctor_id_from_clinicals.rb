class RemoveDoctorIdFromClinicals < ActiveRecord::Migration[5.0]
  def up
    remove_column :clinicals, :doctor_id, :string
  end
  def down
   add_column :clinicals, :doctor_id, :string
  end
end
