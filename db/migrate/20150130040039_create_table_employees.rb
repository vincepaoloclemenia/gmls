class CreateTableEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.integer :role_id
    	t.string  :first_name
    	t.string  :last_name
    	t.string  :department 
      t.string  :position
      t.integer :age
      t.string  :gender
      t.timestamps null: false
    end
  end
end
