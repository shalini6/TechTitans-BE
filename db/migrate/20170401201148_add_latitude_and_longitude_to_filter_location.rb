class AddLatitudeAndLongitudeToFilterLocation < ActiveRecord::Migration[5.0]
  def up
    add_column :filter_locations, :latitude, :float
    add_column :filter_locations, :longitude, :float
  end
  def down
    remove_column :filter_locations, :latitude, :float
    remove_column :filter_locations, :longitude, :float
  end

end
