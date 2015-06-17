class ShipArrival < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :vessel_class
	belongs_to :user
end
