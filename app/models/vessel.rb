class Vessel < ActiveRecord::Base
	acts_as_paranoid  
  attr_accessor :vessel_type_name

  #relationships
  belongs_to :vessel_class
  belongs_to :vessel_type
  has_many :logreqs

  #validations
  validates :name, :vessel_type_id, presence: true
end
