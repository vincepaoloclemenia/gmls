class CreateQuestionnaireCriteria < ActiveRecord::Migration
  def change
    create_table :questionnaire_criteria do |t|
    	t.integer :quality_questionnaire_id
    	t.string  :criteria_title
    	t.text    :criteria_description
      t.timestamps null: false
    end
  end
end
