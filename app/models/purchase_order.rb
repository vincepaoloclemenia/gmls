class PurchaseOrder < ActiveRecord::Base

  # relationships
  has_many :purchase_order_items

  belongs_to :created_by, class_name: "User", foreign_key: "prepared_by"
  belongs_to :rfq
  belongs_to :supplier
  
  #validations
  
  validates :rfq_id, :supplier_id, :purchase_order_number, :payment_terms, :prepared_by, :date_created, :delivery_date,  presence: true
end
