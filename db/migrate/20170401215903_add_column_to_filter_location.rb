class AddColumnToFilterLocation < ActiveRecord::Migration[5.0]
  def up
   add_column :filter_locations, :distance, :float
  end
  def down
   remove_column :filter_locations, :distance, :float
  end
end
