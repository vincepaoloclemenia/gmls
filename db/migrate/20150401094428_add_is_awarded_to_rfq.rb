class AddIsAwardedToRfq < ActiveRecord::Migration
  def change
    add_column :rfqs, :is_awarded, :boolean, :default => false
  end
end
