class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :region, :string
    add_column :locations, :address, :text
  end
end
