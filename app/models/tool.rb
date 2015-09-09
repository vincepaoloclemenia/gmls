class Tool < ActiveRecord::Base

  #validations
  validates_presence_of :name, :quantity, :unit
end
