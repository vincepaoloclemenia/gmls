class AddStepAndSubStepToRfqs < ActiveRecord::Migration
  def change
    add_column :rfqs, :step, :string
    add_column :rfqs, :sub_step, :string
  end
end
