class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.references :institution, foreign_key: true
      t.string :service
      t.integer :service_id
      t.string :day
      t.time :BeginTime
      t.time :EndTime

      t.timestamps
    end
  end
end
