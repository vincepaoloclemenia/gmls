class CreateVesselType < ActiveRecord::Migration
  def change
    create_table :vessel_types do |t|
      t.string :name
      t.integer :vessel_class_id
      t.text :description

      t.timestamps null: false
    end
  end
end
