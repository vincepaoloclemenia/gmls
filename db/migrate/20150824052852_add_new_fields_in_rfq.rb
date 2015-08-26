class AddNewFieldsInRfq < ActiveRecord::Migration
  def change
  	add_column :rfqs, :current_status, :string, default: false
  end
end
