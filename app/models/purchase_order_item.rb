class PurchaseOrderItem < ActiveRecord::Base
  # relationships
  belongs_to :purchase_order
  belongs_to :item
end
