class Addfieldstotableshiparrival < ActiveRecord::Migration
  def change
  	add_column :ship_arrivals, :vessel_class_id, :integer
  	add_column :ship_arrivals, :vessel_type_id, :integer
  end
end
