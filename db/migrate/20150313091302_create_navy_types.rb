class CreateNavyTypes < ActiveRecord::Migration
  def change
    create_table :navy_types do |t|
      t.string :name
      t.integer :department
      t.datetime :deleted_at
      t.timestamps null: false
    end

    add_index :navy_types, :deleted_at
  end
end
