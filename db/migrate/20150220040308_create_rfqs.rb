class CreateRfqs < ActiveRecord::Migration
  def change
    create_table :rfqs do |t|
      t.string :title
      t.integer :principal_id
      t.string :duns
      t.string :cage_code

      t.timestamps null: false
    end
  end
end
