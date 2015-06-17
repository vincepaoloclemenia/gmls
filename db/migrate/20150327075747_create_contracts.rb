class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
    	t.string :requisition_number
    	t.string :contract_number
    	t.datetime :award_effective_date
    	t.string :order_number
    	t.string :solicitation_number
    	t.datetime :solicitation_issue_date
    	t.string :for_solicitation_call
    	t.string :name
    	t.string :telephone_number
    	t.datetime :offer_due_date
    	t.text :issued_by
    	t.string :issue_code
    	t.string :acquisition
    	t.boolean :delivery_for_fob
    	t.string :discount_terms
    	t.boolean :contract_order_under_dpas
    	t.string :rating
    	t.boolean :method_of_solicititation
    	t.text :deliver_to
    	t.string :delivery_code
    	t.text :administered_by
    	t.string :administered_code
    	t.text :contractor
    	t.string :contractor_code
    	t.text :payment_will_be_made
    	t.string :payment_will_be_made_code
    	t.string :facility_code
    	t.boolean :remittance_difference
    	t.boolean :submit_invoices_to_address
    	t.text :accounting_data
    	t.decimal :total_award_amount
    	t.boolean :solicitation_addenda
    	t.boolean :contract_addenda
    	t.boolean :contractor_required_to_sign
    	t.boolean :award_of_contract
    	t.string :signatories
    	t.string :signatories_co
    	t.datetime :date_signed
    	t.string :name_signer
    	t.datetime :date_signer_signed
    	t.text :type_of_print
    	t.integer :department
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :contracts, :deleted_at
  end
end
