class Driver < ActiveRecord::Base
	belongs_to :employer
	has_many :vehicles
end
