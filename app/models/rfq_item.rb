class RfqItem < ActiveRecord::Base
  #acts_as_paranoid
  attr_accessor :name, :item_type, :stat

  #relationships
  belongs_to :item
  belongs_to :rfq
  belongs_to :item_location_price

  #validations
  validates :rfq_id, :item_id, :unit_price, :ui, :quantity, :description, :start_date, :end_date, presence: true
  validates :rfq_id, :uniqueness => {scope: [:item_id], message: "already existing in this rfq."}
  
  before_destroy :delete_rfq_supplier_item
  
  private
    
    def delete_rfq_supplier_item
      item_suppliers = RfqSupplierItem.where(item_id: item_id)
      if item_suppliers
        item_suppliers.delete_all
      end
    end

end
