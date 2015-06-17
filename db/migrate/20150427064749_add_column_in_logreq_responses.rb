class AddColumnInLogreqResponses < ActiveRecord::Migration
  def change
  	add_column :logreq_responses, :deleted_at, :datetime
  end
end
