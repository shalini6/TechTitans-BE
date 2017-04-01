class AddIndexToUserIdOnInstitutions < ActiveRecord::Migration[5.0]
  def up
   add_index :institutions, :user_id, unique: true
  end
  def down
  remove_index :institutions, :user_id 
  end
end
