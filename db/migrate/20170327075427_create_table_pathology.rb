class CreateTablePathology < ActiveRecord::Migration[5.0]
  def change
    create_table :pathologies do |t|
      t.string :name
    end
  end
end
