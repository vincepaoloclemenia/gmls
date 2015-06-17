class ContractItem < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :contract
end
