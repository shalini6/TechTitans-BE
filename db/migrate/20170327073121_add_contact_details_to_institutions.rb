class AddContactDetailsToInstitutions < ActiveRecord::Migration[5.0]
  def change
    add_column :institutions, :email, :string
    add_column :institutions, :website, :string
    add_column :institutions, :contact_number, :string
  	add_column :institutions, :rating, :integer
  end
end
