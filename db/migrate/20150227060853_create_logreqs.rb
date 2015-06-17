class CreateLogreqs < ActiveRecord::Migration
  def change
    create_table :logreqs do |t|
    	t.string :vessel_name
    	t.date   :entry_date
    	t.text   :information
      t.timestamps null: false
    end
  end
end
