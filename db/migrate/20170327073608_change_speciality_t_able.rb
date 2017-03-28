class ChangeSpecialityTAble < ActiveRecord::Migration[5.0]
  def change
  	rename_column :specialities, :discipline, :department
  	remove_column :specialities, :rating
  	rename_table :specialities, :clinicals
  end
end
