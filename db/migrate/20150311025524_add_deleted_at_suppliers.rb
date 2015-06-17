class AddDeletedAtSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :deleted_at, :datetime
  	add_index :suppliers, :deleted_at
  end
end
