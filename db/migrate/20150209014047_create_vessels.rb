class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :captain
      t.string :name
      t.integer :vessel_class_id
      t.integer :vessel_type_id

      t.timestamps null: false
    end
  end
end
