class Contract < ActiveRecord::Base
	acts_as_paranoid
  has_many :contract_items
end
