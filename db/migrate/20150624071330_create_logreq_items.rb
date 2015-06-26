class CreateLogreqItems < ActiveRecord::Migration
  def change
    create_table :logreq_items do |t|
    	t.integer :item_id
      t.text :description
      t.integer :quantity
      t.string :unit
      t.date :start_date
      t.date :end_date
      t.integer :days
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :total_price, precision: 8, scale: 2
      t.integer :logreq_id

      t.timestamps null: false
    end

    add_column :incidental_quotes, :logreq_id, :integer
  end
end
