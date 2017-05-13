class AddContactDetailsToInstitutions < ActiveRecord::Migration[5.0]
  def up
    add_column :institutions, :email, :string
    add_column :institutions, :website, :string
    add_column :institutions, :contact_number, :string
  	add_column :institutions, :rating, :integer
  end
  def down
  	remove_column :institutions, :rating, :integer
    remove_column :institutions, :contact_number, :string
    remove_column :institutions, :website, :string
  	remove_column :institutions, :email, :string
  	end
end
