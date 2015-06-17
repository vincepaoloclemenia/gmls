class CreateTransportationTypes < ActiveRecord::Migration
  def change
    create_table :transportation_types do |t|
      t.string :name
      t.integer :transportation_class_id
      t.text :description

      t.timestamps null: false
    end
  end
end
