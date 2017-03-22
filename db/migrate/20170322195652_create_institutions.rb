class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
    	t.string "name"
    	t.string "about"
    	t.string "photo"
    	t.integer "fee"
    	t.string "password_digest"
      t.timestamps
    end
  end
end
