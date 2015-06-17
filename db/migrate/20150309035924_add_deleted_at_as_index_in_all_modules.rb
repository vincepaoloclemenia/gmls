class AddDeletedAtAsIndexInAllModules < ActiveRecord::Migration
  def change
  	remove_column :users, :delete_at
  	remove_column :roles, :delete_at
  	remove_column :categories, :delete_at
  	remove_column :government_agencies, :delete_at
  	remove_column :item_prices, :delete_at
  	remove_column :items, :delete_at
  	remove_column :locations, :delete_at
  	remove_column :logreqs, :delete_at
  	remove_column :prepservices, :delete_at
  	remove_column :principals, :delete_at
  	remove_column :quality_questionnaires, :delete_at
  	remove_column :questionnaire_criteria, :delete_at
  	remove_column :rfq_items, :delete_at
  	remove_column :service_providers, :delete_at
  	remove_column :services, :delete_at
  	remove_column :ship_arrivals, :delete_at
  	remove_column :sub_categories, :delete_at
  	remove_column :supplier_items, :delete_at
  	remove_column :vessel_classes, :delete_at
  	remove_column :vessel_types, :delete_at
  	remove_column :vessels, :delete_at


  	add_column :users, :deleted_at, :datetime
  	add_column :roles, :deleted_at, :datetime
  	add_column :categories, :deleted_at, :datetime
  	add_column :government_agencies, :deleted_at, :datetime
  	add_column :item_prices, :deleted_at, :datetime
  	add_column :items, :deleted_at, :datetime
  	add_column :locations, :deleted_at, :datetime
  	add_column :logreqs, :deleted_at, :datetime
  	add_column :prepservices, :deleted_at, :datetime
  	add_column :principals, :deleted_at, :datetime
  	add_column :quality_questionnaires, :deleted_at, :datetime
  	add_column :questionnaire_criteria, :deleted_at, :datetime
  	add_column :rfq_items, :deleted_at, :datetime
  	add_column :service_providers, :deleted_at, :datetime
  	add_column :services, :deleted_at, :datetime
  	add_column :ship_arrivals, :deleted_at, :datetime
  	add_column :sub_categories, :deleted_at, :datetime
  	add_column :supplier_items, :deleted_at, :datetime
  	add_column :vessel_classes, :deleted_at, :datetime
  	add_column :vessel_types, :deleted_at, :datetime
  	add_column :vessels, :deleted_at, :datetime

  	add_index :users, :deleted_at
  	add_index :roles, :deleted_at
  	add_index :categories, :deleted_at
  	add_index :government_agencies, :deleted_at
  	add_index :item_prices, :deleted_at
  	add_index :items, :deleted_at
  	add_index :locations, :deleted_at
  	add_index :logreqs, :deleted_at
  	add_index :prepservices, :deleted_at
  	add_index :principals, :deleted_at
  	add_index :quality_questionnaires, :deleted_at
  	add_index :questionnaire_criteria, :deleted_at
  	add_index :rfq_items, :deleted_at
  	add_index :service_providers, :deleted_at
  	add_index :services, :deleted_at
  	add_index :ship_arrivals, :deleted_at
  	add_index :sub_categories, :deleted_at
  	add_index :supplier_items, :deleted_at
  	add_index :vessel_classes, :deleted_at
  	add_index :vessel_types, :deleted_at
  	add_index :vessels, :deleted_at
  end
end
