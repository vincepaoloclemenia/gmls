class CreateShipArrivals < ActiveRecord::Migration
  def change
    create_table :ship_arrivals do |t|
    	t.string  :vassel_name
    	t.integer :vessel_id
    	t.date    :date_arriving
    	t.string  :time_arriving 
      t.timestamps null: false
    end
  end
end
