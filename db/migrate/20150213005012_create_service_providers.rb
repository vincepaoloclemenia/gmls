class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
    	t.string  :name
    	t.string  :contact_person
    	t.string  :mobile_number
      t.string  :telephone
      t.string  :fax
      t.text 		:address
      t.string  :email
      t.timestamps null: false
    end
  end
end
