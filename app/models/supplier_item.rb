class SupplierItem < ActiveRecord::Base
	acts_as_paranoid  
  attr_accessor :item_name, :item_type, :supplier_name

  #relationships
  belongs_to :supplier
  belongs_to :item

  #validations
  validates :price, :item_id, :supplier_id, presence: true
  validates :supplier_id, :uniqueness => {scope: [:item_id], message: "already existing in the database."}

end
