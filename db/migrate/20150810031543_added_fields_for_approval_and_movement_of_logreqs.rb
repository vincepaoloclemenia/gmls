class AddedFieldsForApprovalAndMovementOfLogreqs < ActiveRecord::Migration
  def change
  	add_column :logreqs, :approved_logreq, :string, default: 'Pending'
  	add_column :logreqs, :approved_logreq_response, :string, default: 'Pending'
  	add_column :incidental_quotes, :approved_incidental_quotes, :string, default: 'Pending'
  	add_column :incidental_quotes, :approved_incidental_quote_items, :string, default: 'Pending'
  end
end
