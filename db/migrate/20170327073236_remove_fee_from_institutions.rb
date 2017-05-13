class RemoveFeeFromInstitutions < ActiveRecord::Migration[5.0]
  def up
  	remove_column :institutions, :fee
  	change_column :institutions, :about, :text
  end
  def down
  	add_column :institutions, :fee, :integer

  end
end
