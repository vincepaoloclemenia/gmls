class VesselClass < ActiveRecord::Base
	acts_as_paranoid  
  #relationships
  has_many :vessel_types, dependent: :destroy
  has_many :ship_arrivals, dependent: :destroy
  has_many :vessels, dependent: :destroy

  #validations
  validates :name, presence: true
end
