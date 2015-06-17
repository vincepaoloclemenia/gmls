class AddFieldsToVesselTypes < ActiveRecord::Migration
  def change
    add_column :vessel_types, :draft, :string
    add_column :vessel_types, :length, :string
    add_column :vessel_types, :beam, :string
    add_column :vessel_types, :displacement, :string
    add_column :vessel_types, :crew_count, :integer
  end
end
