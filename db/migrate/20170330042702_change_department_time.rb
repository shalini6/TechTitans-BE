class ChangeDepartmentTime < ActiveRecord::Migration[5.0]
  def change
  	change_column :clinicals, :department, :integer
  end
end
