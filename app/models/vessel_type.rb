class VesselType < ActiveRecord::Base
	acts_as_paranoid
  #relationships
  belongs_to :vessel_class
  has_many :vessels, dependent: :destroy

  #validations
  validates_presence_of :name, :beam, :length, :crew_count, :draft, :displacement
end
