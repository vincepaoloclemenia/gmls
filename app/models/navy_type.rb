class NavyType < ActiveRecord::Base
	validates_presence_of :name
	validates_format_of :name, :with => /^[a-zA-Z\d\s]*$/, :multiline => true
	validates_uniqueness_of :name, :case_sensitive => false
end
