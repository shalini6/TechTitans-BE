class AddColumnToVideo < ActiveRecord::Migration[5.0]
  def up
   add_column :videos, :prescription, :text 
  end
  def down
   remove_column :videos, :prescription, :text
  end
end
