class AddDeletedAtToRfqs < ActiveRecord::Migration
  def change
    add_column :rfqs, :deleted_at, :datetime
  	add_index :rfqs, :deleted_at
  end
end
