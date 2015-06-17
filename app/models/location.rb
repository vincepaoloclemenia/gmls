class Location < ActiveRecord::Base
	acts_as_paranoid

  has_many :supplier 

  validates :name, presence: true

  
end
