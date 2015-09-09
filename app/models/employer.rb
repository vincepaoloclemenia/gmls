class Employer < ActiveRecord::Base
	has_many :drivers
	has_many :vehicles
	validates_presence_of :owner_contact_person
end
