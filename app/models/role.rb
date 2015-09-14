class Role < ActiveRecord::Base
  acts_as_paranoid
  
  validates_presence_of :access_level, :role_name
  validates_uniqueness_of :role_name, :case_sensitive => false

  has_many :employees, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :role_managements, dependent: :destroy
  
end
