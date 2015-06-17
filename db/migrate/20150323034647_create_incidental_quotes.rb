class CreateIncidentalQuotes < ActiveRecord::Migration
  def change
    create_table :incidental_quotes do |t|
    	t.string :quotation_no
    	t.string :company
    	t.text :address
    	t.string :subject
    	t.text :subject_detail
    	t.text :terms_and_condition
    	t.text :validity
    	t.string :prepared_by
      t.datetime :deleted_at	
      t.timestamps null: false
    end
    add_index :incidental_quotes, :deleted_at
  end
end
