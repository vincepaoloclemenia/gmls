class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :rate, :decimal, precision: 8, scale: 2
    add_column :items, :description, :text 
  end
end
