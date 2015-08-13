class AddNewFieldsOnIncidentalQuotes < ActiveRecord::Migration
  def change
  	add_column :incidental_quotes, :status, :string, :default => "Pending"
  end
end
