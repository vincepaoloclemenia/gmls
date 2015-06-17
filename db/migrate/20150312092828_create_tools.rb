class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :quantity
      t.string :unit

      t.timestamps null: false
    end
  end
end
