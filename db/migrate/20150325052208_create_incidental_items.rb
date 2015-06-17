class CreateIncidentalItems < ActiveRecord::Migration
  def change
    create_table :incidental_items do |t|
      t.integer :incidental_quote_id
      t.integer :item_id
      t.string  :area
      t.decimal :price
      t.text    :remarks
      t.integer :department
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :incidental_items, :deleted_at
  end
end
