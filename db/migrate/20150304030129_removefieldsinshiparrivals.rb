class Removefieldsinshiparrivals < ActiveRecord::Migration
  def change
  	remove_column :ship_arrivals, :employee_id
  	
  	add_column :ship_arrivals, :user_id, :integer
  end
end
