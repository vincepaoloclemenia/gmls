class Vehicle < ActiveRecord::Base
	belongs_to :employer
	belongs_to :driver
  #validations
  validates :name, presence: true

end
