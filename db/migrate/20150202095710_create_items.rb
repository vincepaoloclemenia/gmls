class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :sub_category_id
      t.string :package_size
      t.string :unit_of_issue
      t.string :type
      t.decimal :unit_price

      t.timestamps null: false
    end
  end
end
