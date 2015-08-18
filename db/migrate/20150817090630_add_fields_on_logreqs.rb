class AddFieldsOnLogreqs < ActiveRecord::Migration
  def change
  	add_column :logreqs, :pier_docking_location, :string
  end
end
