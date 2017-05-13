class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :patient, foreign_key: true
      t.references :timeslot, foreign_key: true
      t.time :BeginTime
      t.time :EndTime
      t.date :date
      t.boolean :mode

      t.timestamps
    end
  end
end
