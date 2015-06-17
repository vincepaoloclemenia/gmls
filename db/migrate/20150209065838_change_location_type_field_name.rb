class ChangeLocationTypeFieldName < ActiveRecord::Migration
  def change
    remove_column :locations, :type
    add_column :locations, :location_type, :string
  end
end
