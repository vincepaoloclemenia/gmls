class AddServiceTypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :service_type, :string
  end
end
