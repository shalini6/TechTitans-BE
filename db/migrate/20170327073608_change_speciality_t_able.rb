class ChangeSpecialityTAble < ActiveRecord::Migration[5.0]
  def up
  	rename_column :specialities, :discipline, :department
  	remove_column :specialities, :rating
  	rename_table :specialities, :clinicals
  end
  def down
  	rename_table :clinicals, :specialities
  	add_column :specialities, :rating, :integer
  	rename_column :specialities, :department, :discipline
  end
end
