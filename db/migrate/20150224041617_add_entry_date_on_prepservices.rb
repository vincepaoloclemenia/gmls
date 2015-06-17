class AddEntryDateOnPrepservices < ActiveRecord::Migration
  def change
  	add_column :prepservices, :entry_date, :date
  end
end
