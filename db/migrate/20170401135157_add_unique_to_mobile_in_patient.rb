class AddUniqueToMobileInPatient < ActiveRecord::Migration[5.0]
  def up
   add_index :patients, :mobile , unique: true 
  end
  def down
   remove_index :patients, :mobile
  end
end
