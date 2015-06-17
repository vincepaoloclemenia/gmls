class AddFieldsToSuppliers < ActiveRecord::Migration
  def change

    add_column :suppliers, :supplier_category_id, :integer
    add_column :suppliers, :location_id, :integer

    add_index :suppliers, :supplier_category_id
    add_index :suppliers, :location_id
  end
end
