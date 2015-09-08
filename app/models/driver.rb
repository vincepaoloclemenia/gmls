class Driver < ActiveRecord::Base
	belongs_to :employer
	has_many :vehicles

	validates :name, presence: true, format: { without: /\s/ }
	validates :contact_no, presence: true, numericality: { only_integer: true }
	validates :employer_id, presence: true
end
