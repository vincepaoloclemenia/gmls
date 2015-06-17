class AddDepartmentToToolsAndVehicles < ActiveRecord::Migration
  def change
	  add_column :vehicles, :department, :integer
	  add_column :tools, :department, :integer  
  end
end
