class SupplierPricingDetail < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :service
	belongs_to :item
	has_many :incidental_items

end
