class Employee < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :department, :position, :age, :gender
  # validates_uniqueness_of 

  belongs_to :role
end