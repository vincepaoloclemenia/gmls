class Employer < ActiveRecord::Base
	has_many :drivers
	has_many :vehicles

	validates_presence_of :owner_contact_person
	validates_format_of :owner_contact_person, :with => /^[a-zA-Z\d\s]*$/, :multiline => true

end