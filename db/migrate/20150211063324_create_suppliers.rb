class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :contact_person
      t.string :mobile_number
      t.string :telephone_number
      t.string :fax_number
      t.string :address
      t.string :email

      t.timestamps null: false
    end
  end
end
