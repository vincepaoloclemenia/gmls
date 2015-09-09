class Driver < ActiveRecord::Base
	belongs_to :employer
	has_many :vehicles

	validates_presence_of :name
	validates_format_of :name, :with => /[-a-z]/
	validates :contact_no, presence: true, numericality: { only_integer: true }
	validates :employer_id, presence: true
end
