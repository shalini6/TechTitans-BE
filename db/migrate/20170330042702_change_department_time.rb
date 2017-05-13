class ChangeDepartmentTime < ActiveRecord::Migration[5.0]
  def up
  	change_column :clinicals, :department, :integer
  end
  def down
  	change_column :clinicals, :department, :string
  end
end
