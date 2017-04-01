class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :clinical, foreign_key: true
      t.references :patient, foreign_key: true
      t.string :room_key

      t.timestamps
    end
  end
end
