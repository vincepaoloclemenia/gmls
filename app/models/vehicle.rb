class Vehicle < ActiveRecord::Base
	belongs_to :employer
	belongs_to :driver
  #validations
  validates :name, :contact_person, :mobile_number, presence: true

end
