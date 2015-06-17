class Tool < ActiveRecord::Base

  #validations
  validates :name, :quantity, :unit, presence: true
end
