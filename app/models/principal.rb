class Principal < ActiveRecord::Base
 	acts_as_paranoid 	
  #relationships
  has_many :rfqs
  has_many :logreqs

  #validations
  validates :name, :contact_number, :email, :address, :point_of_contact, presence: true
  validates :name, uniqueness: true 
end
