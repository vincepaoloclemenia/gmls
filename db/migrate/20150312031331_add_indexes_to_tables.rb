class AddIndexesToTables < ActiveRecord::Migration
  def change
  	add_index :employees, :role_id
  	add_index :item_prices, :item_id
  	add_index :items, :category_id
  	add_index :items, :sub_category_id
  	add_index :questionnaire_criteria, :quality_questionnaire_id
  	add_index :rfq_items, :item_id
  	add_index :rfq_items, :rfq_id
  	add_index :rfqs, :principal_id
  	add_index :ship_arrivals, :vessel_id
  	add_index :ship_arrivals, :vessel_class_id
  	add_index :ship_arrivals, :vessel_type_id
  	add_index :sub_categories, :category_id
  	add_index :supplier_items, :supplier_id
  	add_index :supplier_items, :item_id
  	add_index :users, :role_id
  	add_index :vessel_types, :vessel_class_id
  	add_index :vessels, :vessel_class_id
  	add_index :vessels, :vessel_type_id
  end
end
