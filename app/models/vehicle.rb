class Vehicle < ActiveRecord::Base

  #validations
  validates :name, :contact_person, :mobile_number, presence: true

end
