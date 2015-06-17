class DropTransportationClass < ActiveRecord::Migration
  def change
    drop_table :transportation_classes
    drop_table :transportation_types
  end
end
