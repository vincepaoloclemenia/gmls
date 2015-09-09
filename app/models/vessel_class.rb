class VesselClass < ActiveRecord::Base
	acts_as_paranoid  
  #relationships
  has_many :vessel_types, dependent: :destroy
  has_many :ship_arrivals, dependent: :destroy
  has_many :vessels, dependent: :destroy

  #validations
  validates_presence_of :name
  validates_format_of :name, :with => /^[a-zA-Z\d\s]*$/, :multiline => true
end
