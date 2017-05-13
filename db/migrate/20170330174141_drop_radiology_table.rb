class DropRadiologyTable < ActiveRecord::Migration[5.0]
  def up
   drop_table :radiologies
  end

  def down 
   create_table :radiologies do |t|
   t.string :name
   end
  end
end
