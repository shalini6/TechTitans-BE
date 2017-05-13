class DropPathologyTable < ActiveRecord::Migration[5.0]
  def up
   drop_table :pathologies 
  end
  def down
   create_table :pathologies do |t|
    t.string :name
  end
 end
end
