class Vessel < ActiveRecord::Base
	acts_as_paranoid  
  attr_accessor :vessel_type_name

  #relationships
  belongs_to :vessel_class
  belongs_to :vessel_type
  has_many :logreqs

  #validations
  validates_presence_of :name, :flag_of_registry, :owner_operator, :grt, :nrt, :dwt, :loa, :service_speed, :conference, :type_of_service, :num_of_booms, :capacity_boom, :type_of_boom, :num_of_hatches, :type_of_hatch, :boom_cycle, :customs_reg_number, :voyage_num
  validates_format_of :name, :with => /^[a-zA-Z\d\s]*$/, :multiline => true
end
