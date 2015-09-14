class Principal < ActiveRecord::Base
 	acts_as_paranoid 	
  #relationships
  has_many :rfqs
  has_many :logreqs

  # before_create :check_duplicate_entry

  #validations
  validates :name, :contact_number, :email, :address, :point_of_contact, presence: true
  validates :name, :uniqueness_without_deleted => true

end
