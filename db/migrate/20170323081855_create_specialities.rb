class CreateSpecialities < ActiveRecord::Migration[5.0]
  def change
    create_table :specialities do |t|
      t.integer 'institution_id'
      t.string 'speciality_name'
      t.string 'doctor_id'
      t.string 'doctor_name'
      t.integer 'experience'
      t.integer 'rating'
      t.string 'discipline'
      t.timestamps
    end
  end
end
