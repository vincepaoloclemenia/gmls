class CreateContractItems < ActiveRecord::Migration
  def change
    create_table :contract_items do |t|
    	t.integer :contract_id
    	t.string :item_no
    	t.text :schedule_of_supplies
    	t.integer :quantity
    	t.string :unit
    	t.decimal :unit_price
    	t.decimal :amount
    	t.integer :department
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :contract_items, :deleted_at
  end
end
