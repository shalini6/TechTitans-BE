class AddColumnToClinicals < ActiveRecord::Migration[5.0]
  def up
   add_column :clinicals, :password, :string 
  end
  def down
   remove_column :clinicals, :password, :string 
  end
end
