class AddFieldsToRfqs < ActiveRecord::Migration
  def change
    add_column :rfqs, :monitoring_officer_id, :integer
    add_index :rfqs, :monitoring_officer_id

    add_column :rfqs, :requirements_officer_id, :integer
    add_index :rfqs, :requirements_officer_id
  end
end
