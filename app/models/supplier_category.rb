class SupplierCategory < ActiveRecord::Base
  
  has_many :suppliers

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
