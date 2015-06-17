class AddNewFieldsOnTableLogreqs < ActiveRecord::Migration
  def change
  	add_column :logreqs, :logreg_info, :text
  	add_column :logreqs, :vessel_id, :integer
  	add_column :logreqs, :vessel_class_name, :string
  	add_column :logreqs, :date_of_arrival, :datetime
  	add_column :logreqs, :date_of_departure, :datetime
  	add_column :logreqs, :pier, :string
  end
end