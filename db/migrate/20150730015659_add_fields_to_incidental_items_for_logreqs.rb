class AddFieldsToIncidentalItemsForLogreqs < ActiveRecord::Migration
  def change
  	add_column :incidental_items, :logreq_id, :integer
  	add_column :incidental_items, :service_id, :integer
  end
end
