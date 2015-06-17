class VesselType < ActiveRecord::Base
	acts_as_paranoid
  #relationships
  belongs_to :vessel_class
  has_many :vessels, dependent: :destroy

  #validations
  validates :name, :vessel_class_id, presence: true
end
