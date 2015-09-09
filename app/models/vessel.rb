class Vessel < ActiveRecord::Base
	acts_as_paranoid  
  attr_accessor :vessel_type_name

  #relationships
  belongs_to :vessel_class
  belongs_to :vessel_type
  has_many :logreqs


  before_destroy :check_for_logreq_entries
  #validations
  validates :name, :vessel_type_id, presence: true

  private
  	def check_for_logreq_entries
  		if logreqs.any?
	      errors[:notice] << "cannot delete vessel that has already a data in the Logistics Requirements / RFQ"
	      return false
	    end
  	end

end
