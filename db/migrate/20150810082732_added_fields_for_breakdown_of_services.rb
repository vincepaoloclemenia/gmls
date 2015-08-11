class AddedFieldsForBreakdownOfServices < ActiveRecord::Migration
  def change
  	add_column :logreqs, :assigned_user_breakdown_services, :integer
  	
  end
end
