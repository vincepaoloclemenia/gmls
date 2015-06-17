class AddDeletedAtInAllModules < ActiveRecord::Migration
  def change
  	add_column :users, :delete_at, :date
  	add_column :roles, :delete_at, :date
  	add_column :categories, :delete_at, :date
  	add_column :government_agencies, :delete_at, :date
  	add_column :item_prices, :delete_at, :date
  	add_column :items, :delete_at, :date
  	add_column :locations, :delete_at, :date
  	add_column :logreqs, :delete_at, :date
  	add_column :prepservices, :delete_at, :date
  	add_column :principals, :delete_at, :date
  	add_column :quality_questionnaires, :delete_at, :date
  	add_column :questionnaire_criteria, :delete_at, :date
  	add_column :rfq_items, :delete_at, :date
  	add_column :service_providers, :delete_at, :date
  	add_column :services, :delete_at, :date
  	add_column :ship_arrivals, :delete_at, :date
  	add_column :sub_categories, :delete_at, :date
  	add_column :supplier_items, :delete_at, :date
  	add_column :vessel_classes, :delete_at, :date
  	add_column :vessel_types, :delete_at, :date
  	add_column :vessels, :delete_at, :date
  end
end
