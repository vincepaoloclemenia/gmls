class AddFieldsToPrincipals < ActiveRecord::Migration
  def change
    add_column :principals, :address, :text
    add_column :principals, :point_of_contact, :string
  end
end
