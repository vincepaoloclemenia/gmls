class CreateLogreqResponses < ActiveRecord::Migration
  def change
    create_table :logreq_responses do |t|
    	t.integer :logreq_id
    	t.text    :question
    	t.text    :response
      t.timestamps null: false
    end
  end
end