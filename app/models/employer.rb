class Employer < ActiveRecord::Base
	has_many :drivers
	has_many :vehicles

	validates :owner_contact_person, presence: true
	
end
