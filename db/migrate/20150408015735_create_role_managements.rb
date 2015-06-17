class CreateRoleManagements < ActiveRecord::Migration
  def change
    create_table :role_managements do |t|
    	t.integer :role_id
    	t.string :module_name
    	t.boolean :can_create
    	t.boolean :can_delete
    	t.boolean :can_edit
    	t.boolean :can_view
    	t.integer :department
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
