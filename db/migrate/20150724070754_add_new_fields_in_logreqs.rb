class AddNewFieldsInLogreqs < ActiveRecord::Migration
  def change
  	add_column :logreqs, :principal_id, :integer
  	add_column :incidental_items, :location_id, :integer
  	add_column :incidental_items, :quantity, :string
  	add_column :incidental_items, :unit, :string
  	add_column :incidental_items, :tariff_code, :string
  	add_column :purchase_orders, :status, :string, :default => "Ordered"
  	add_column :purchase_orders, :tag_by_assigned_user, :integer
  end
end
