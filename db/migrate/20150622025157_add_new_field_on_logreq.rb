class AddNewFieldOnLogreq < ActiveRecord::Migration
  def change
  	add_column :logreqs, :user_id, :integer
  	add_column :tools, :description, :text
  	add_column :tools, :price_per_unit, :decimal
  	add_column :tools, :supplier_id, :integer
  end
end