class Employee < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :department, presence: true
  validates :position, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  belongs_to :role
end