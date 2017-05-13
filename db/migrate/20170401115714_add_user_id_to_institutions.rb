class AddUserIdToInstitutions < ActiveRecord::Migration[5.0]
  def up
   add_column :institutions, :user_id, :string
  end
  def down
   remove_column :institutions, :user_id, :string
  end
end
