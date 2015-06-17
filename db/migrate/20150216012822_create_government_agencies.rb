class CreateGovernmentAgencies < ActiveRecord::Migration
  def change
    create_table :government_agencies do |t|
      t.string :department_or_division
      t.string :contact_person
      t.string :mobile_number
      t.string :telephone
      t.string :fax
      t.string :email
      t.text :address

      t.timestamps null: false
    end
  end
end
