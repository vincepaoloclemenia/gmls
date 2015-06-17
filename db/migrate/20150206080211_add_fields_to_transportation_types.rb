class AddFieldsToTransportationTypes < ActiveRecord::Migration
  def change
    add_column :transportation_types, :draft, :string
    add_column :transportation_types, :length, :string
    add_column :transportation_types, :beam, :string
    add_column :transportation_types, :displacement, :string
    add_column :transportation_types, :crew_count, :integer
  end
end
