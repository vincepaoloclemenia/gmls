class AddFieldsToIncidentalQuotes < ActiveRecord::Migration
  def change
  	add_column :incidental_quotes, :department, :integer
  end
end
