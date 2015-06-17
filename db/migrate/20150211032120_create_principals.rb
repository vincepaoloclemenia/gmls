class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
      t.string :name
      t.string :email
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
