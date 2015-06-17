class AddColumnAssignedEmployeeIdToShipArrivals < ActiveRecord::Migration
  def change
  	add_column :ship_arrivals, :employee_id, :integer
  	add_column :ship_arrivals, :date_assigned, :date
  end
end
