class Role < ActiveRecord::Base
  acts_as_paranoid
  
  validates :role_name, presence: true
  validates :access_level, presence: true

  has_many :employees, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :role_managements, dependent: :destroy
  
end
