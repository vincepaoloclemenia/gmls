class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :owner_contact_person
      t.string :mobile_no
      t.timestamps null: false
    end
    add_column :vehicles, :employer_id, :integer
    add_column :vehicles, :vehicle_type, :string
    add_column :vehicles, :driver_id, :integer
  end
end