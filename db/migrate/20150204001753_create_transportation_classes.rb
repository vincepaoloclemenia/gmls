class CreateTransportationClasses < ActiveRecord::Migration
  def change
    create_table :transportation_classes do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
