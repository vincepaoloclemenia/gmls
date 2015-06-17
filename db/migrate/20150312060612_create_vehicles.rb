class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :contact_person
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
