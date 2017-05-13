class ChangeColumnRateToCost < ActiveRecord::Migration[5.0]
  def up
  	rename_column :rates, :rate ,:cost
  end
  def down
  	rename_column :rates, :cost ,:rate
  end
end
