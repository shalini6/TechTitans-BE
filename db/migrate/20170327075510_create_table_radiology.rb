class CreateTableRadiology < ActiveRecord::Migration[5.0]
  def change
    create_table :radiologies do |t|
      t.string :name
    end
  end
end
