class AddDepartmentOnTables < ActiveRecord::Migration
  def change
  	remove_column :users, :department
  	remove_column :employees, :department

  	add_column :categories, :department, :integer
	add_column :employees, :department, :integer
  	add_column :government_agencies, :department, :integer
	add_column :item_prices, :department, :integer
	add_column :items, :department, :integer
	add_column :locations, :department, :integer
	add_column :logreqs, :department, :integer
	add_column :prepservices, :department, :integer
	add_column :principals, :department, :integer
	add_column :quality_questionnaires, :department, :integer
	add_column :rfq_items, :department, :integer
	add_column :rfqs, :department, :integer
	add_column :roles, :department, :integer
	add_column :service_providers, :department, :integer
	add_column :services, :department, :integer
	add_column :ship_arrivals, :department, :integer
	add_column :sub_categories, :department, :integer
	add_column :supplier_items, :department, :integer
	add_column :suppliers, :department, :integer
	add_column :users, :department, :integer
	add_column :vessel_classes, :department, :integer
	add_column :vessel_types, :department, :integer
	add_column :vessels, :department, :integer

  end
end
