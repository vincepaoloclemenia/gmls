class RfqSupplierItem < ActiveRecord::Base

  #relationships
  belongs_to :item
  belongs_to :supplier

  #validations
  validates :item_id, :supplier_id, :price, :rfq_id, presence: true
end
