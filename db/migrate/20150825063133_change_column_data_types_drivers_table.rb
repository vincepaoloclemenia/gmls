class ChangeColumnDataTypesDriversTable < ActiveRecord::Migration
  def change
  	change_column :drivers, :employer_id, 'integer USING CAST(employer_id AS integer)'
  end
end
