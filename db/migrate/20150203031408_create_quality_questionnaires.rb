class CreateQualityQuestionnaires < ActiveRecord::Migration
  def change
    create_table :quality_questionnaires do |t|
    	t.string :port
    	t.string :vessel_name
    	t.date 	 :port_visit_date
    	t.string :field_prior_to_arrival
    	t.string :field_upon_arrival
    	t.string :field_during_the_port_call
    	t.string :field_overall
    	t.text   :comments
    	t.string :field_name
    	t.string :field_signature
    	t.string :field_date_signed
      t.timestamps null: false
    end
  end
end
