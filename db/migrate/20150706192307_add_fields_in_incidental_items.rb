class AddFieldsInIncidentalItems < ActiveRecord::Migration
  def change
  	add_column :incidental_items, :supplier_id, :integer
  end
end
