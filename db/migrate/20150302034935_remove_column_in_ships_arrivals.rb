class RemoveColumnInShipsArrivals < ActiveRecord::Migration
  def change
  	remove_column :logreqs, :vessel_name
		remove_column :ship_arrivals, :vassel_name
  	
  	add_column :logreqs, :shipname, :string
  	add_column :ship_arrivals, :shipname, :string
  end
end
