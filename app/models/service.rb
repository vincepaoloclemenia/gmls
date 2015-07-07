class Service < ActiveRecord::Base
	acts_as_paranoid
	has_many :supplier_pricing_details
end
