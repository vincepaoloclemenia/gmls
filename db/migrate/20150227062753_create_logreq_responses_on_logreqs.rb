class CreateLogreqResponsesOnLogreqs < ActiveRecord::Migration
  def change
    add_column :logreqs, :logreq_responses, :string
  end
end
