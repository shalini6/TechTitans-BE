class RemoveFeeFromInstitutions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :institutions, :fee
  	change_column :institutions, :about, :text
  end
end
