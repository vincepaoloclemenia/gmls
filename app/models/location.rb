class Location < ActiveRecord::Base
	acts_as_paranoid

  has_many :supplier
  has_many :incidental_items 

  validates :name, presence: true

  
end
